struct OptionalNested {
    nest: InnerStruct?;
}

struct InnerStruct {
    x: Int;
}

contract OptionalNestedContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            nest: null,
        };
    }
}