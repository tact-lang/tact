// Deep and wide optional fields, edge test
struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract LotsOfOptionals {
    data: ManyOpts;

    init() {
        self.data = ManyOpts{
            a: null, b: null, c: null, d:null, e:null, f:null, g:null, h:null, i:null,
        };
    }
}