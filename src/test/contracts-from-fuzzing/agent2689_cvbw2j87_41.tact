contract DefaultsAndSerializations {
    a: Int = 0;
    b: Int as uint32 = 10;
    c: Int? = null;

    init() {
        self.a = 1;
        self.b = 20;
        self.c = 30;
    }
}