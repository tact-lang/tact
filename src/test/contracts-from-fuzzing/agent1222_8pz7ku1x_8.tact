struct XWide {
    a: Int = 1;
    b: Int = 2;
    c: Int?;
    d: Int = 4;
    e: String = "e";
    f: Bool = true;
    g: Bool?;
    h: String?;
    i: Int = 9;
    j: Int?;
    k: Int = 11;
    l: Int = 12;
    m: Bool = false;
    n: String = "n";
    o: Int?;
    p: Bool?;
    q: String?;
    r: Int = 18;
    s: String = "s";
    t: Bool = true;
}

contract TestContract {
    massive: XWide;

    init() {
        self.massive = XWide{
            a: 100,
            d: 400,
            e: "hello",
            f: false,
            i: 900,
            k: 1100,
            m: true,
            r: 1800,
            t: false,
            // all others left to default/null
        };
    }

    receive() {
        let val = self.massive.a + self.massive.d + self.massive.i + self.massive.k + self.massive.r;
    }
}