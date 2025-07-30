struct NestedStruct {
    innerFlag: Bool;
    innerCounter: Int;
}

contract StructStorage {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            innerFlag: false,
            innerCounter: 77,
        };
    }
}
