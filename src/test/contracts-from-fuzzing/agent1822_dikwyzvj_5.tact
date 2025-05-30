struct S1 {
    f1: Int?;
    f2: Bool?;
}

contract OptionalVars {
    s1: S1?;
    flag: Bool;

    init() {
        self.s1 = S1{ f1: null, f2: null };
        self.flag = true;
    }
}