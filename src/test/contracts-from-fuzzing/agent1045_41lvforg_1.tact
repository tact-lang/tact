struct NestedStruct {
    innerA: Int;
    innerB: Bool;
}

contract TestContract {
    s: NestedStruct;

    init() {
        self.s = NestedStruct{innerA: 1, innerB: true};
    }
}