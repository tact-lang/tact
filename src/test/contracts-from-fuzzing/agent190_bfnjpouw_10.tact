struct ManyOptionals {
    a: Int?;
    b: Int? as uint64;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: String?;
    h: Int?;
    i: Bool?;
    j: Address?;
    k: Cell?;
    l: Slice?;
    m: String?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null, g: null,
            h: null, i: null, j: null, k: null, l: null, m: null,
        };
    }
}