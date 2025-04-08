struct ComplexOptionalNested {
    a: Int?;
    b: String?;
    sub: SubStruct?;
}

struct SubStruct {
    val: Int;
    flag: Bool?;
    note: String;
}

contract BigOptionalNest {
    f: ComplexOptionalNested;

    init() {
        self.f = ComplexOptionalNested{
            a: null,
            b: null,
            sub: null
        };
    }
}