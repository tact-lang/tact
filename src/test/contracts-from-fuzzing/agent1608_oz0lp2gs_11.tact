struct NestedOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    
    nested: InnerOpt;
}

struct InnerOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedOptionalStructs {
    val: NestedOptionals = NestedOptionals{
        o1: null,
        o2: true,
        o3: null,
        nested: InnerOpt{
            a: 11,
            b: null,
            c: "" }
    };

    init() {
        self.val = NestedOptionals{
            o1: 1,
            o2: false,
            o3: "yo",
            nested: InnerOpt{
                a: null,
                b: true,
                c: "foo" }
        };
    }
}