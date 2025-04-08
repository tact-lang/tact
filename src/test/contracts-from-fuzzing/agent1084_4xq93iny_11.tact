struct NestedStruct {
    inner1: String;
    inner2: String;
    inner3: String;
}

contract ContractWithMultipleStructs {
    s1: NestedStruct;
    s2: NestedStruct;

    init() {
        self.s1 = NestedStruct{inner1:"a", inner2:"b", inner3:"c"};
        self.s2 = NestedStruct{inner1:"x", inner2:"y", inner3:"z"};
    }
}