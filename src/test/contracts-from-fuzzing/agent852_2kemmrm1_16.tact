contract MixedDefaults {
    mustAssign1: Int;
    mustAssign2: String;

    optInt: Int?;
    optBool: Bool? = null;
    optStr: String?;

    init() {
        self.mustAssign1 = 123;
        self.mustAssign2 = "yes";
        // optional fields left unassigned
    }

    receive() {}
}