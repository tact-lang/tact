contract WeirdSerializations {
    a: Int as int8;
    b: Int as uint1;
    c: Int as int257;

    init() {
        self.a=-1;
        self.b=1;
        self.c=42;
    }
}