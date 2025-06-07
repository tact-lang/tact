struct InnerRef {
    a: Int;
    b: Bool;
}

struct Container {
    ref1: InnerRef;
    ref2: InnerRef;
    ref3: InnerRef;
}

contract BigNestedContainer {
    cont: Container;

    init() {
        self.cont = Container{
            ref1: InnerRef{ a: 1, b: true },
            ref2: InnerRef{ a: 2, b: false },
            ref3: InnerRef{ a: 3, b: true },
        };
    }
}