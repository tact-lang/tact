struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

struct Combo {
    a: A;
    b: B;
    c: C;
}

contract ComboContract {
    combo: Combo = Combo{a:A{x:1},b:B{y:2},c:C{z:3}};
}