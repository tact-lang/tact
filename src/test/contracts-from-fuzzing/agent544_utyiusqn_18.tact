struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: String?;
}

contract TestContract {
    m: ManyOptionals;

    init() {
        self.m = ManyOptionals{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}