struct Both {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

contract C {
    b: Both;

    init() {
        self.b = Both{ optInt:null,optBool:null,optStr:null };
    }
}