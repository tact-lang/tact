struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Int;
    y: Inner;
    z: String;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            x: 1,
            y: Inner{ a: 2, b: false },
            z: "test",
        };
    }
}
