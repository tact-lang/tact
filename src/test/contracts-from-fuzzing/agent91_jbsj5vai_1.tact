struct NestedStruct {
    value: Int;
    enabled: Bool;
}

struct OuterStruct {
    nested: NestedStruct;
    status: Bool;
}

contract NestedFieldsContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            nested: NestedStruct{ value: 42, enabled: true },
            status: false
        };
    }
}
