struct ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
    i: Int?;
    j: Int?;
    k: Int?;
    l: Int?;
    m: Int?;
    n: Int?;
    o: Int?;
    p: Int?;
}

contract ManyOptionalsPersist {
    state: ManyOptionals;

    init() {
        self.state = ManyOptionals{
            a: null, b: null, c: null, d: null,
            e: null, f: null, g: null, h: null,
            i: null, j: null, k: null, l: null,
            m: null, n: null, o: null, p: null
        };
    }
}