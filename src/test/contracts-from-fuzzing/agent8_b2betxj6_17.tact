struct JustBool {
    v: Bool;
}

contract BoolInitialized {
    f: JustBool;

    init() {
        self.f = JustBool{ v: false };
    }
}