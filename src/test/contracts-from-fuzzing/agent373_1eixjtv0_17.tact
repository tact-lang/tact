struct OptStr {
    opt: String?;
}

contract BigOpt {
    s: OptStr;
    num: Int;
    
    init() {
        self.s = OptStr{ opt: null };
        self.num = 123;
    }
}