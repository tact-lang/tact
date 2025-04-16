struct NestedOptionalStruct {
    n1: Int?;
    n2: Bool?;
    n3: InnerOptStruct?;
}

struct InnerOptStruct {
    z: Int;
    f: Bool;
}

contract OptionInsideStruct {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            n1: null,
            n2: null,
            n3: null,
        };
    }
}
