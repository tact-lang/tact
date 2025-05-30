struct InnerStruct {
    name: String;
    flag: Bool;
    val: Int;
}

struct ComplexNested {
    f1: InnerStruct;
    f2: InnerStruct?;
    f3: Bool;
    f4: String?;
    f5: Int?;
}

contract NestedMix {
    state: ComplexNested;

    init() {
        self.state = ComplexNested{
            f1: InnerStruct{name:"hi", flag:true, val:1},
            f2: null,
            f3: false,
            f4: "test",
            f5: 123,
        };
    }
}
