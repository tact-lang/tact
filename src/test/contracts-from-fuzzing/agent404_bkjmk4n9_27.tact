struct DeepOption {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Mid1 {
    inner: DeepOption;
}

struct Mid2 {
    optInner: DeepOption?;
}

contract OptNest {
    m1: Mid1;
    m2: Mid2;
    init() {
        self.m1 = Mid1{inner: DeepOption{a:null, b:null, c:null}};
        self.m2 = Mid2{optInner: null};
    }
}