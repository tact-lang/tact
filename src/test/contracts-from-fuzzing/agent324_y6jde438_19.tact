contract InitDefaultsOptional {
    f1: Int?;
    f2: Bool = true;
    f3: String?;
    f4: String = "hey";

    init() {
        self.f1 = null;
        self.f3 = null;
    }
}