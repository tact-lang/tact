// Struct with many optional fields with default nulls
struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: String?;
    e: Bool?;
    f: Int?;
    g: String?;
}

contract TestContract {
    s: ManyOpts;

    init() {
        self.s = ManyOpts{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}