struct NestedOptionals {
    field1: Int?;
    field2: Bool?;
    nested: InnerStruct?;
}

struct InnerStruct {
    value: Int;
}

contract TestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            field1: null,
            field2: true,
            nested: InnerStruct{ value: 7 }
        };
    }
}