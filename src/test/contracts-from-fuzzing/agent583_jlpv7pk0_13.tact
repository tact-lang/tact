struct InnerOpt {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: String?;
}

struct OuterOpt {
    f: InnerOpt?;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: String?;
}

contract OptsEverywhere {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            f: InnerOpt{
                a: null, b: true, c: null, d: null, e: "hi"
            },
            g: 42, h: null, i: myAddress(), j: null
        };
    }
}