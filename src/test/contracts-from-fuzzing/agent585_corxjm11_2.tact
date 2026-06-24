struct NestedStruct1 {
    y: Int;
}

contract StructInField {
    ns: NestedStruct1;

    init() {
        self.ns = NestedStruct1{ y: 5 };
    }
}