contract WithoutDefaults {
    intNoDefault: Int;
    boolNoDefault: Bool;
    stringNoDefault: String;
    optInt: Int?;

    init() {
        self.intNoDefault = 1;
        self.boolNoDefault = false;
        self.stringNoDefault = "test";
    }

    receive() {
        let _ = self.intNoDefault;
    }
}