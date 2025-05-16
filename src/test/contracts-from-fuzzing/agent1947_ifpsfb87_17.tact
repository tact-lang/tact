contract DefaultBoolOpt {
    f1: Bool = true;
    f2: Bool? = null;
    init() {
        self.f1 = false;
        self.f2 = null;
    }
}