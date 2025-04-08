contract NestedOptionals {
    s1: Int?;
    s2: String?;
    s3: Bool?;
    s4: Address?;

    init() {
        self.s1 = null;
        self.s2 = null;
        self.s3 = true;
        self.s4 = myAddress();
    }
}
