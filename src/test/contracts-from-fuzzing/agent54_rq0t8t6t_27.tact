contract OptSerializedDefaults {
    a: Int? as uint8 = null;
    b: Int? as int64 = null;
    c: Bool? = true;
    d: String? = null;

    init() {
        self.a = 5;
        self.b = null;
        self.c = false;
        self.d = "yo";
    }
}