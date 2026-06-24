struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    m: Inner;
    n: Int;
}

contract Test3 {
    s: Outer;

    init() {
        self.s = Outer{ m: Inner{ a: 5, b: true }, n: 99 };
    }
    receive() {}
}