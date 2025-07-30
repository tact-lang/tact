// long list of diverse optional and non-optional fields
struct LargeVarious {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;
    m: Int;
    n: Bool;
    o: String;
    p: Int?;
    q: Bool?;
    r: String?;
}

contract LargeFields {
    val: LargeVarious;

    init() {
        self.val = LargeVarious{
            a: 1,
            b: true,
            c: "1",
            d: 2,
            e: false,
            f: "2",
            g: 3,
            h: false,
            i: "3",
            j: 4,
            k: null,
            l: null,
            m: 5,
            n: true,
            o: "4",
            p: null,
            q: true,
            r: "5",
        };
    }
}