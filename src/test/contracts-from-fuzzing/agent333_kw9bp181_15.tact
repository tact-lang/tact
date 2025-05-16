struct ManyNestedOpts {
    i1: Int?;
    i2: Int?;
    b1: Bool?;
    s1: String?;
    s2: String?;
    c1: Cell?;
}

contract TestContract {
    mno: ManyNestedOpts;

    init() {
        self.mno = ManyNestedOpts {
            i1:null, i2:null, b1:null,
            s1:null, s2:null, c1:null
        };
    }
}