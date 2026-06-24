contract ChainFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;

    init() {
        self.f1 = 1;
        self.f2 = self.f1 + 1;
        self.f3 = self.f2 + 1;
        self.f4 = self.f3 + 1;
        self.f5 = self.f4 + 1;
    }
}