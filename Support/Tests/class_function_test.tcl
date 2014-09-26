#function defs:
proc printArguments args {
   foreach arg $args {
      puts $arg
   }
}
proc mult {varName {multiplier 2}} {
   upvar 1 $varName var
   set var [expr {$var * $multiplier}]
}

#class defs:
oo::class create fruit {
    method eat {} {
        puts "yummy!"
    }
}
oo::class create banana {
    superclass fruit
    constructor {} {
        my variable peeled
        set peeled 0
    }
    proc procInFunction {varName {multiplier 2}} {
       upvar 1 $varName var
       set var [expr {$var * $multiplier}]
    }
    method peel {} {
        my variable peeled
        set peeled 1
        puts "skin now off"
        proc procInMethod {varName {multiplier 2}} {
           upvar 1 $varName var
           set var [expr {$var * $multiplier}]
        }
    }
    method edible? {} {
        my variable peeled
        return $peeled
    }
    method eat {} {
        if {![my edible?]} {
            my peel
        }
        next
    }
}
set b [banana new]
$b eat               → prints "skin now off" and "yummy!"
fruit destroy
$b eat               → error "unknown command"

oo::object create src
oo::objdefine src method msg {} {puts foo}
oo::copy src dst
oo::objdefine src method msg {} {puts bar}
src msg              → prints "bar"
dst msg              → prints "foo"