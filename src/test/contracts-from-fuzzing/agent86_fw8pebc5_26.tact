// struct with many optional fields
struct ManyOpts {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Bool?;
    f: Bool?;
    g: Bool?;
    h: Bool?;
    i: String?;
    j: String?;
}

contract TestContract {
    mo: ManyOpts;

    init() {
        self.mo = ManyOpts{
            a: null, b: null, c: null, d: null, e: null, f: null, g: null, h: null, i: null, j: null
        };
    }
}