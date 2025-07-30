struct Inner {
    z: Int;
}

struct Container {
    optionalInner: Inner?;
}

contract TestContract {
    complex: Container;

    init() {
        self.complex = Container{ optionalInner: Inner{ z: 17 } };
    }
}