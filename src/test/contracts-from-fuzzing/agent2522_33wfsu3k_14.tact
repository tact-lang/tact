struct Inner {
    x: Int;
    y: Bool;
}

struct Middle {
    z: String;
    inner: Inner;
}

struct Outer {
    id: Int;
    middle: Middle;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            id: 5,
            middle: Middle{
                z: "hello",
                inner: Inner{ x: 42, y: true }
            }
        };
    }
}