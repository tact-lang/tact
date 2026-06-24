struct AStruct {
    x: Int;
}

contract DeepOptionalsContract {
    optA: AStruct?;
    optStr: String?;
    optBool: Bool?;
    plainInt: Int;
    plainStr: String;

    init() {
        self.optA = null;
        self.optStr = "abc";
        self.optBool = true;
        self.plainInt = 11;
        self.plainStr = "def";
    }
}