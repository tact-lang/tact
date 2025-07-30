contract OptionalPrimitives {
    ai: Int?;
    ab: Bool?;
    aa: Address?;
    ac: Cell?;
    aslice: Slice?;
    astr: String?;
    init() {
        self.ai = null;
        self.ab = null;
        self.aa = null;
        self.ac = null;
        self.aslice = null;
        self.astr = null;
    }
}