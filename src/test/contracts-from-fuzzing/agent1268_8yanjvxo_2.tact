struct OptionalNested {
    field1: Int?;
    nestedOpt: AnotherStruct?;
}

struct AnotherStruct {
    field2: Bool;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            field1: null,
            nestedOpt: null
        };
    }
}