struct Inner {
    x: Int;
    y: String;
}

struct Outer {
    inner: Inner;
    z: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 1,
                y: "test",
            },
            z: true,
        };
    }
}
