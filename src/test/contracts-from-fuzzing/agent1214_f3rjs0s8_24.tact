struct SBoolStr {
    f1: Bool;
    f2: String;
}

contract BoolStrComb {
    b1: Bool;
    s1: String;
    sbs: SBoolStr;
    init() {
        self.b1 = true;
        self.s1 = "ok";
        self.sbs = SBoolStr{ f1: false, f2: "no" };
    }
}