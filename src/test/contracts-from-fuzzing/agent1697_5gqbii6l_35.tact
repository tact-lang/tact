struct SubNested {
    a: Int?;
    b: Bool? = null;
}

struct NestedS {
    intField: Int as uint16;
    optSub: SubNested?;
    stringF: String? = null;
}

contract TestContract {
    complex: NestedS;

    init() {
        self.complex = NestedS{
            intField: 12345,
            optSub: SubNested{
                a:null
            }
        };
    }
}