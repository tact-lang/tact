contract MixedPersistence {
    b: Bool;
    iopt: Int?;
    txt: String;
    addrOpt: Address?;

    init() {
        self.b = true;
        self.iopt = null;
        self.txt = "hi";
        self.addrOpt = null;
    }
}
