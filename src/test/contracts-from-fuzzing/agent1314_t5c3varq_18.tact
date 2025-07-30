contract EdgeNullable {
    ai: Int?;
    ab: Bool?;
    ac: Cell?;
    aslice: Slice?;
    astr: String?;
    addr: Address?;

    init() {
        self.ai = null;
        self.ab = null;
        self.ac = null;
        self.aslice = null;
        self.astr = null;
        self.addr = null;
    }
}