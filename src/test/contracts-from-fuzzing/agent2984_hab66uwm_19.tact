struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;
}

contract Test20 {
    m: MultiOpt;
    init() {
        self.m = MultiOpt{ a:null, b:null, c:123, d:true };
    }
}
