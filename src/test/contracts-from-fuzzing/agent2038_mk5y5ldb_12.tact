struct OptMix {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
}

contract C {
    m: OptMix;

    init() {
        self.m = OptMix{a:null, b:true, c:"abc", d:null};
    }
}