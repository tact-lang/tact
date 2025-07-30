struct S1 {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract ManyOpts {
    s: S1;
    init() {
        self.s = S1{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}