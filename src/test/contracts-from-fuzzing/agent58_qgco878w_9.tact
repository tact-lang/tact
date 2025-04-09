struct ManyOpts {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Bool?;
    f: Int?;
}

contract OptStructMany {
    packed: ManyOpts;

    init() {
        self.packed = ManyOpts{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
        };
    }
}