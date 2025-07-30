struct LargeNested {
    a: Bool;
    b: String;
    c: Int;
    d: Bool?;
    e: String?;
    f: Int?;
    g: Bool;
    h: String;
    i: Int;
    j: Bool?;
    k: String?;
    l: Int?;
}

contract TestContract {
    val: LargeNested;
    init() {
        self.val = LargeNested{
            a: true,
            b: "b",
            c: 1,
            d: null,
            e: null,
            f: null,
            g: false,
            h: "h",
            i: 2,
            j: null,
            k: null,
            l: null,
        };
    }
}
