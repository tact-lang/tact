struct InnerMost {
    flag: Bool;
    note: String;
}

struct Middle {
    level: Int;
    inner: InnerMost;
}

struct Outer {
    description: String;
    middle: Middle;
    optionalStr: String?;
}

contract NestedOpts {
    val: Outer;

    init() {
        self.val = Outer{
            description: "outer",
            middle: Middle{
                level: 17,
                inner: InnerMost{
                    flag: true,
                    note: "deep"
                }
            },
            optionalStr: null
        };
    }
}
