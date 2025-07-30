contract OptIntAndDefaults {
    i: Int?;
    defBool: Bool = true;
    defStr: String = "set";

    init() {
        self.i = null;
    }
}