contract PartialDefaults {
    a: Int;       // no default, must assign
    b: Int = 5;  // has default, may skip

    init() {
        self.a = 1;  // compulsory
        // omit b
    }
}
