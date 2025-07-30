struct S {
    f1: Int;
    f2: Int?;
    f3: String;
    f4: String?;
}

contract OptMix2 {
    s: S;
    init() {
        self.s = S{ f1:1, f2:null, f3:"x", f4:null };
    }
}