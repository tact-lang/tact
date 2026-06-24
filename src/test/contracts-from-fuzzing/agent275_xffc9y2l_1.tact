struct NestedStruct {
    value: Int;
    flag: Bool;
}

contract NestedStructStorage {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ value: 42, flag: true };
    }
}