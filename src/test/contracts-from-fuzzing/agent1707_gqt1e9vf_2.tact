struct NestedStruct {
    inner: Int;
    flag: Bool;
}

contract NestedContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{ inner: 1, flag: true };
    }
}