struct OpWrap {
    x: Int?;
}

struct OpWrap2 {
    a: Int?;
    b: OpWrap?;
}

contract DoubleWrap {
    f: OpWrap2;
    
    init() {
        self.f = OpWrap2{ a:null, b:null };
    }
}