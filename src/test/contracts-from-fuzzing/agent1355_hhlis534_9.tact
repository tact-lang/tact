struct Inner1 { a: Int; }
struct Inner2 { b: Int; }
struct Inner3 { c: Int; }
struct Inner4 { d: Int; }

struct Middle1 {
    x: Inner1;
    y: Inner2;
}

struct Middle2 {
    z: Inner3;
    w: Inner4;
}

struct Outer {
    m1: Middle1;
    m2: Middle2;
}

contract NestedComplex {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Middle1{ x: Inner1{a:1}, y: Inner2{b:2} },
            m2: Middle2{ z: Inner3{c:3}, w: Inner4{d:4} },
        };
    }

    receive() {}
}