struct OptionalComposite {
    optStruct: Inner?;
}

struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    f: OptionalComposite;

    init() {
        self.f = OptionalComposite {
            optStruct: null
        };
    }
}