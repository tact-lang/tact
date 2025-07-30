struct DeeplyNested {
    inner: StructA;
}

struct StructA {
    sub: StructB;
}

struct StructB {
    value: Int;
}

contract AssignNestedStepwise {
    data: DeeplyNested;

    init() {
        let tempB = StructB{value: 123};
        let tempA = StructA{sub: tempB};
        self.data = DeeplyNested{inner: tempA};
    }
}
