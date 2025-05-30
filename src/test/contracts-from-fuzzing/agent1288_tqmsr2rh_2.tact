struct NestedStruct {
    flag: Bool;
    count: Int;
}

contract TestContract {
    data: NestedStruct?;

    init() {
        self.data = NestedStruct{flag: false, count: -1};
    }
}