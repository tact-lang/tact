struct OptionalNested {
    nested: InnerStruct?;
}

struct InnerStruct {
    x: Int;
}

contract TestContract {
    store: OptionalNested;

    init() {
        self.store = OptionalNested{
            nested: null,
        };
    }
}