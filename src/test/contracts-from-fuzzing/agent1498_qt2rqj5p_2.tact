struct OptionalStruct {
    field1: Int;
    optNested: NestedStruct?;
}

struct NestedStruct {
    val: Int;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            field1: 10,
            optNested: null
        };
    }
}
