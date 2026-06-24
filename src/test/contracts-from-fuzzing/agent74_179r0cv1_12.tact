struct Inner {
    x: Int = 100;
    y: Bool = false;
}

struct Wrapper {
    nested: Inner;
    z: Int;
}

contract TestContract {
    data: Wrapper;
    init() {
        self.data = Wrapper{ nested: Inner{}, z: 123 };
    }
}