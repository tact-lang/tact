struct Inner {
    x: Int;
    y: Bool;
}

struct Outer {
    inner: Inner;
    z: String;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 5,
                y: false,
            },
            z: "test",
        };
    }
}
