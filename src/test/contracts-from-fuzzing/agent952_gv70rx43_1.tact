struct Inner1 { a: Int; }

struct Inner2 { b: Int; }

struct Outer {
    i1: Inner1;
    i2: Inner2;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            i1: Inner1{a: 1},
            i2: Inner2{b: 2},
        };
    }
}
