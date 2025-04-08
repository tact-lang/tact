struct OptionalNested {
    nested: NestedStruct?;
}

struct NestedStruct {
    str_val: String;
    num_val: Int;
}

contract TestContract {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            nested: NestedStruct{
                str_val: "abc",
                num_val: 42,
            },
        };
    }
}