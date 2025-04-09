struct NestedStruct {
    num: Int;
    flag: Bool;
}

contract StructInStorage {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{
            num: 123,
            flag: false,
        };
    }
}