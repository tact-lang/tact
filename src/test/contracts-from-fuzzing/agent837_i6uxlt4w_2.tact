struct DeeplyNested {
    sub1: SubStruct1;
}

struct SubStruct1 {
    sub2: SubStruct2;
}

struct SubStruct2 {
    sub3: SubStruct3;
}

struct SubStruct3 {
    flag: Bool;
}

contract TestDeepNestedStructs {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{ sub1: SubStruct1{ sub2: SubStruct2{ sub3: SubStruct3{ flag: true } } } };
    }

    receive() {
        let _ = self.nested.sub1.sub2.sub3.flag;
    }
}