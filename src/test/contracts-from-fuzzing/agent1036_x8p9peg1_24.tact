contract InterleavedOpt {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
    f5: String;
    f6: String?;
    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = true;
        self.f4 = false;
        self.f5 = "abc";
        self.f6 = "def";
    }
}