contract OptSerDefaults {
    a: Int? as int16 = null;
    b: Int? as uint32 = null;

    init() {
        self.a = 100;
        self.b = null;
    }
}