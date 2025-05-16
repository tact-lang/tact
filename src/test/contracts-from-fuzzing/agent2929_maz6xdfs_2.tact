struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    inner: Inner?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null
        };
    }
}