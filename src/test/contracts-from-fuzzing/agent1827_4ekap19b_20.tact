struct LargeNested {
    a: Int;
    b: InnerLarge;
    c: String;
}

struct InnerLarge {
    d: Int;
    e: Bool?;
    f: String;
    g: Int?;
}

contract LargeNestedStructContract {
    n: LargeNested;

    init() {
        self.n = LargeNested{
            a:1,
            b: InnerLarge{
                d:2, e:null, f:"str", g:null
            },
            c: "end"
        };
    }
}