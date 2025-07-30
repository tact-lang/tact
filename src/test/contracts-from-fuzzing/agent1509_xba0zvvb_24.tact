contract OptionalAndDefaults {
    f1: Int?;
    f2: Int = 1;
    f3: Bool?;
    f4: Bool = false;
    f5: String?;
    f6: String = "x";
    f7: Address?;
    f8: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");

    init() {
        self.f1 = 10;
        self.f3 = true;
        self.f5 = "hi";
        self.f7 = null;
    }

    receive() {
        let _ = self.f6;
    }
}