struct Inner {
    a: Int as uint8;
    b: Bool?;
}

struct Outer {
    x: Inner?;
    y: Int as int64;
}

contract Test {
    state: Outer;

    init() {
        self.state = Outer{ x: null, y: -7 };
    }
}