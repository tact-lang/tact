struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    inner: Inner?;
    z: String;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            inner: null,
            z: "hello",
        };
    }
}