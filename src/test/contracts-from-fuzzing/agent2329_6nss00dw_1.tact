struct NestedStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    ns: NestedStruct;
    flag: Bool;

    init() {
        self.ns = NestedStruct{ a: 1, b: true };
        self.flag = false;
    }
}
