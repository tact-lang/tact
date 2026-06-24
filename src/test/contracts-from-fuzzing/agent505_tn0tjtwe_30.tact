contract SerializedDefaults {
    a: Int as uint32 = 12;
    b: Int as int8 = -5;
    c: Bool = true;

    init() {
        self.a = 0;
        self.b = 1;
        self.c = false;
    }
}
