struct A { x: Int; y: Int; }
struct B { a1: A; a2: A; }

contract ManyStructs {
    one: A = A{x:1, y:2};
    two: B = B{a1:A{x:3,y:4}, a2:A{x:5,y:6}};
}