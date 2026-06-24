struct LargeComplex {
    i1: Int?;
    i2: Int;
    s1: String;
    b1: Bool?;
    s2: String?;
    i3: Int = 3;
    s3: String = "x";
    b2: Bool = false;
}

contract TestLargeComplex {
    param: LargeComplex;
    init() {
        self.param = LargeComplex{
            i1: null,
            i2: 2,
            s1: "a",
            b1: null,
            s2: null
        };
    }
}
