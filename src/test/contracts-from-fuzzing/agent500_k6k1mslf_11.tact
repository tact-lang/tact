struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

struct Combo {
    x: A;
    y: B;
    z: C;
}

contract MultiStructs {
    val: Combo;

    init() {
        self.val = Combo{ x: A{a:1}, y: B{b:2}, z: C{c:3} };
    }
}