// test struct with a lot of optional fields enabled reordering
struct ManyOpts {
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
}
contract OptOrder {
    v: ManyOpts;

    init() {
        self.v = ManyOpts{
            a:null,
            b:null,
            c:null,
            d:null,
            e:null,
            f:null,
            g:null,
            h:null,
            i:null,
            j:null
        };
    }
}