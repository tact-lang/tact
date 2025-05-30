struct LargeNested {
    a: Int;
    b: String;
    c: Bool;
    d: InnerLarge;
}

struct InnerLarge {
    e: Int?;
    f: String?;
    g: Bool;
    h: SubInner;
}

struct SubInner {
    x: Int;
    y: String;
    z: Bool?;
}

contract BigComplex {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            a: 1,
            b: "hey",
            c: true,
            d: InnerLarge{
                e: null,
                f: null,
                g: false,
                h: SubInner{
                    x: 5,
                    y: "yo",
                    z: null
                }
            }
        };
    }
}
