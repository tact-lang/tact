struct OptionalInnerStruct {
    nested: Inner?;
}

struct Inner {
    x: Int;
    y: Bool;
}

contract TestContract {
    d: OptionalInnerStruct;

    init() {
        self.d = OptionalInnerStruct{ nested: null };
    }
}