struct A { a: Int; }
struct B { b: Bool; }
struct C { c: String; }

contract ManyStructParams(
    p1: A,
    p2: B,
    p3: C,
    p4: A?,
    p5: B?,
    p6: C?,
) {}