struct StructWithOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct StructWithStructs {
    s1: StructWithOptionals;
    s2: StructWithOptionals?;
}

contract NestedOptionalStructs {
    store: StructWithStructs;

    init() {
        self.store = StructWithStructs{
            s1: StructWithOptionals{ a: null, b: null, c: null },
            s2: null
        };
    }
}