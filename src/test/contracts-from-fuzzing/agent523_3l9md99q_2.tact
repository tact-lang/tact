struct NestedStruct {
    a: Int;
    b: Bool;
}

contract NestedStructContract {
    s: NestedStruct;
    init() {
        self.s = NestedStruct{a: 5, b: true};
    }
}