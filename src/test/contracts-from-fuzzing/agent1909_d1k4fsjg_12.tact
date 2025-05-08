struct MidNested {
    val: Int;
    nested: InnerMost;
}

struct InnerMost {
    name: String;
    flag: Bool;
    opt: Int?;
}

contract DifferentNestLayouts {
    field1: MidNested;
    field2: InnerMost;

    init() {
        self.field1 = MidNested {
            val: 5,
            nested: InnerMost {
                name: "hi",
                flag: true,
                opt: null
            }
        };
        self.field2 = InnerMost {
            name: "there",
            flag: false,
            opt: null
        };
    }
}