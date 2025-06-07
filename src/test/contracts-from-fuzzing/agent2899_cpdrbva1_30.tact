struct EmptyOpt { val: Int?; }

contract OptDefaults {
    f1: Int?;
    f2: EmptyOpt?;

    init() {
        self.f1 = null;
        self.f2 = null;
    }
}
