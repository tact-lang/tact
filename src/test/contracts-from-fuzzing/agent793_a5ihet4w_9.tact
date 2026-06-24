struct IntAndBool {
    intPart: Int;
    boolPart: Bool;
}

contract TestContract {
    nested1: IntAndBool;
    nested2: IntAndBool;

    init() {
        self.nested1 = IntAndBool{intPart: 5, boolPart: false};
        self.nested2 = IntAndBool{intPart: 42, boolPart: true};
    }

    receive() {}
}