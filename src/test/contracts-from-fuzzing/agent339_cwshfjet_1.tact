struct Inner {
    z: Int;
}

struct Outer {
    inner: Inner;
    y: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{z: 7},
            y: 42
        };
    }
}