contract InitOverride {
    f1: Int = 1;
    f2: Bool = false;
    f3: String = "hi";
    init() {
        self.f1 = 100;
        self.f2 = true;
        self.f3 = "overridden";
    }
    receive() {}
}