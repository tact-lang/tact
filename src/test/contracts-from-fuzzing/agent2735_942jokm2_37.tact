contract IntWidths {
    a: Int as int1;
    b: Int as int257;
    c: Int? as int8;
    d: Int? as int257;

    init() {
        self.a = 0;           // valid in int1
        self.b = 123456789;   // valid in 257 bits
        self.c = null;        // implicit null for optionals
        self.d = null;
    }
}
