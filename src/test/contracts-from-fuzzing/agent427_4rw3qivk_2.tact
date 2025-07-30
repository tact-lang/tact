struct InnerStruct {
    value: Int;
    flag: Bool;
}

contract NestedStorage {
    nestedField: InnerStruct;

    init() {
        self.nestedField = InnerStruct{
            value: 123,
            flag: true
        };
    }
}