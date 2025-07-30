struct Val1 { a:Int }
struct Val2 { b:Val1 }
struct Val3 { c:Val2 }
struct Val4 { d:Val3 }
struct Val5 { e:Val4 }
struct Val6 { f:Val5 }
struct Val7 { g:Val6 }
struct Val8 { h:Val7 }
struct Val9 { i:Val8 }
struct Val10 { j:Val9 }
struct Val11 { k:Val10 }

contract MegaNested {
    val: Val11 = Val11{ k: Val10{ j: Val9{ i: Val8{ h: Val7{ g: Val6{ f: Val5{ e: Val4{ d: Val3{ c: Val2{ b: Val1{ a:42 } } } } } } } } } } };
}