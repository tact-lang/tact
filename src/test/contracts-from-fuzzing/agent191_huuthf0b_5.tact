struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Address?;
    l: Cell?;
    m: Slice?;
    n: Int?;
    o: Bool?;
    p: String?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null, b: null, c: null, d: null,
            e: null, f: null, g: null, h: null,
            i: null, j: null, k: null, l: null,
            m: null, n: null, o: null, p: null
        };
    }
}