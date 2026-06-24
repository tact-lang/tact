struct Inner {
    p: Int;
    q: Bool;
}

struct Outer {
    x: Int;
    y: Bool;
    z: Inner;
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{
            x: 10,
            y: true,
            z: Inner{ p: 20, q: false }
        };
    }
}
