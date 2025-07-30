struct NestedStruct {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int;
}

contract NestedAssign {
    data: NestedStruct;

    init() {
        let innerInst = InnerStruct{value: 9};
        self.data = NestedStruct{inner: innerInst};
    }
}