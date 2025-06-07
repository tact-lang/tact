struct BoolStr {
    b: Bool;
    s: String;
}

contract ArrayOfStructs {
    s1: BoolStr;
    s2: BoolStr;
    s3: BoolStr;
    s4: BoolStr;
    s5: BoolStr;

    init() {
        self.s1 = BoolStr{ b: true, s: "a" };
        self.s2 = BoolStr{ b: false, s: "b" };
        self.s3 = BoolStr{ b: true, s: "c" };
        self.s4 = BoolStr{ b: false, s: "d" };
        self.s5 = BoolStr{ b: true, s: "e" };
    }
}