struct ManyNestedMix {
    a: Int;
    b: Bool?;
    c: String;
    d: Bool;
    e: String?;
    f: Int?;
}

struct TopLevel {
    one: ManyNestedMix;
    two: ManyNestedMix;
}

contract MultipleNestedMixes {
    val: TopLevel;

    init() {
        self.val = TopLevel{
            one: ManyNestedMix{
                a: 1,
                b: null,
                c: "one",
                d: true,
                e: null,
                f: null
            },
            two: ManyNestedMix{
                a: 2,
                b: false,
                c: "two",
                d: false,
                e: null,
                f: 42
            }
        };
    }
}
