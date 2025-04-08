contract OptionalAndNonOptional {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
    f5: String;
    f6: String?;

    init() {
        self.f1 = 1;
        self.f2 = null;
        self.f3 = false;
        self.f4 = null;
        self.f5 = "text";
        self.f6 = null;
    }
}