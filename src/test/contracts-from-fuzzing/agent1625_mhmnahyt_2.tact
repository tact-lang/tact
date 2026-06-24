struct NestedStruct {
    y: Int;
    flag: Bool;
}

contract StructInStorage {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{
            y: 42,
            flag: true,
        };
    }
}
