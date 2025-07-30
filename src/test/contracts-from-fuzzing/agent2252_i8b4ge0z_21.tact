contract MultipleOptionalsAndTypes {
    intOpt: Int?;
    boolOpt: Bool?;
    intNorm: Int;
    boolNorm: Bool;
    str: String;
    init() {
        self.intOpt = 5;
        self.boolOpt = null;
        self.intNorm = 7;
        self.boolNorm = true;
        self.str = "hi";
    }
}