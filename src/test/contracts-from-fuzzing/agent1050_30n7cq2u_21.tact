struct OpStr {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptStructNull {
    s: OpStr;

    init() {
        self.s = OpStr{ a:null, b:null, s:null };
    }
}