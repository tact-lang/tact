contract MultiEmptyOptionals {
    ia: Int?;
    ib: Int?;
    ba: Bool?;
    bb: Bool?;
    sa: String?;
    sb: String?;
    aa: Address?;
    ab: Address?;
    
    init() {
        self.ia = null;
        self.ib = null;
        self.ba = null;
        self.bb = null;
        self.sa = null;
        self.sb = null;
        self.aa = null;
        self.ab = null;
    }
}