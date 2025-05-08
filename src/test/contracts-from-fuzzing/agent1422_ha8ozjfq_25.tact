struct Outer {
    x: Int;
    y: Inner;
    z: String;
}

struct Inner {
    a: Int;
    b: String;
}

contract ForwardNest {
    data: Outer;

    init() {
        self.data = Outer{
            x: 9,
            y: Inner{
                a: 42,
                b: "hi",
            },
            z: "test",
        };
    }
}