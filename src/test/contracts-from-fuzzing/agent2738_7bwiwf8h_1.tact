struct NestedStruct {
    num: Int;
    flag: Bool;
}

contract TestContract {
    data: NestedStruct;

    init() {
        self.data = NestedStruct{num: 123, flag: true};
    }
}
