struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    inner: Inner;
    z: String?;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            inner: Inner{x: 10, y: false},
            z: null
        };
    }
}