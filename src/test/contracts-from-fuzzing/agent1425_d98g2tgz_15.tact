// Long list of optional primitives
struct ManyOpts {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Cell?;
}

contract ManyOptionals {
    data: ManyOpts;

    init() {
        self.data = ManyOpts{
            a: null,
            b: 2,
            c: null,
            d: 4,
            e: null,
            f: null,
            g: null,
            h: null,
            i: null
        };
    }
}