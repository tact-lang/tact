struct DeepNest {
    sub: NestedOptionalStruct?;
}

struct NestedOptionalStruct {
    value: Int?;
    flag: Bool;
}

contract DeepOptionalTester {
    deep: DeepNest;

    init() {
        self.deep = DeepNest{sub: NestedOptionalStruct{value: null, flag: true}};
    }
}