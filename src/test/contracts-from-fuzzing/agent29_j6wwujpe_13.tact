struct OptNested {
    s1: String?;
    i1: Int?;
    sub: SubStruct?;
}

struct SubStruct {
    flag: Bool;
    value: Int;
}

contract NestedOptionalFields {
    data: OptNested;

    init() {
        self.data = OptNested{
            s1: null,
            i1: null,
            sub: null
        };
    }
}