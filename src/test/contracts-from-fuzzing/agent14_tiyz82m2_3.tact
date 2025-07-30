struct InnerMost {
    val: Int;
}

struct Inner {
    nest: InnerMost;
    s: String;
}

struct Middle {
    inner: Inner;
    b: Bool;
}

struct Outer {
    middle: Middle;
    s: String?;
    flag: Bool?;
}

contract NestedDeep {
    info: Outer;
    
    init() {
        self.info = Outer{
            middle: Middle{
                inner: Inner{
                    nest: InnerMost{ val: 123 },
                    s: "innermost",
                },
                b: true,
            },
            s: null,
            flag: false,
        };
    }
}