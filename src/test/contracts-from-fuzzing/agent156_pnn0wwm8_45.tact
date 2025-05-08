struct SWithManyOpts {
    a: Int?;
    b: Int?;
    c: String?;
    d: Bool?;
    e: Int?;
}

contract ManyOptsField {
    s: SWithManyOpts;

    init() {
        self.s = SWithManyOpts{
            a:null, b:1, c:null, d:true, e:null
        };
    }
}
