struct ManyOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: Cell?;
    f: Slice?;
    g: Address?;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Cell?;
    l: Slice?;
    m: Address?;
}

contract ContractWithManyOptionals {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals{
            a: null, b: null, c: null, d: null, e: null, f: null, g: null,
            h: null, i: null, j: null, k: null, l: null, m: null };
    }
}