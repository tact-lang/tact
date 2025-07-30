struct NestedStruct1 {
    innerFlag: Bool;
    innerNumber: Int;
}

contract NestedSingle {
    innerData: NestedStruct1;

    init() {
        self.innerData = NestedStruct1{ innerFlag: false, innerNumber: 42 };
    }
}
