struct Inner {
    a: Int as uint64;
    b: Bool;
}

struct Outer {
    x: Inner;
    y: Int as int16;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{ x: Inner{ a:123, b:true }, y: -42 };
    }
}