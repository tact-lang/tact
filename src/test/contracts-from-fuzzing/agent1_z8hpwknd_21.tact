struct ManyOpts {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
}

contract NestedNulls {
    val: ManyOpts;

    init() {
        self.val = ManyOpts{ a:null, b:null, c:null, d:null };
    }
}