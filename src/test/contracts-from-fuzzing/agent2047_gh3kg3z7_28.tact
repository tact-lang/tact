contract BoolDefaults {
    f1: Bool = true;
    f2: Bool = false;
    f3: Bool = true;

    init() {
        self.f1=false;
        self.f2=true;
        self.f3=false;
    }
}