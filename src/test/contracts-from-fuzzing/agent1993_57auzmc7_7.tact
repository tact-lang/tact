struct OptionalNestedStruct {
    nested: NestedStruct?;
}

struct NestedStruct {
    x: Int;
    y: String;
}

contract TestContract {
    ons: OptionalNestedStruct;

    init() {
        self.ons = OptionalNestedStruct{ nested: null };
    }
}