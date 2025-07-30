struct OptionalNested {
    nested: InnerStruct?;
}

struct InnerStruct {
    value: Int;
    flag: Bool;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            nested: null
        };
    }
}