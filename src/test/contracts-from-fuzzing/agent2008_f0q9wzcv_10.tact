contract DefaultBoolFields {
    f1: Bool = true;
    f2: Bool = false;
    f3: Bool;  // no default

    init() {
        self.f3 = true;
    }
}
