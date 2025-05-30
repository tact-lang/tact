struct OptionStruct {
    field1: Int?;
    field2: Bool?;
    field3: NestedOpt?;
}

struct NestedOpt {
    nestedField: String?;
}

contract OptionalsInStorage {
    data: OptionStruct;

    init() {
        self.data = OptionStruct{
            field1: null,
            field2: true,
            field3: NestedOpt{
                nestedField: "Hello"
            }
        };
    }
}
