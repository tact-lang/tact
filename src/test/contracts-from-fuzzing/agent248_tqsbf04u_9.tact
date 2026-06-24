contract AllNulls {
    intOpt: Int?; 
    strOpt: String?;
    boolOpt: Bool?;
    intOpt2: Int?;
    boolOpt2: Bool?;

    init() {
        self.intOpt = null;
        self.strOpt = null;
        self.boolOpt = null;
        self.intOpt2 = null;
        self.boolOpt2 = null;
    }
}