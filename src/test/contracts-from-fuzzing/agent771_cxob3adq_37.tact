struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D;
}

struct D {
    e: E;
}

struct E {
    val: Int;
}

contract DeepChain {
    state: A = A{
        b: B{ c: C{ d: D{ e: E{ val: 42 } } } }
    };

    init() {
        self.state = A{
            b: B{ c: C{ d: D{ e: E{ val: 99 } } } }
        };
    }
}