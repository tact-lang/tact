struct NestedStruct {
    num: Int;
    flag: Bool;
}

contract NestedStructStorage {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            num: 1,
            flag: true,
        };
    }
}