contract ManySerializationsConst {
    const U64MAX: Int = 18446744073709551615;

    a: Int as int8;
    b: Int as uint24;
    c: Int as int128;
    d: Int as uint64;

    init() {
        self.a = -128;
        self.b = 16777215;
        self.c = - (1 << 127);
        self.d = self.U64MAX;
    }

    receive() {}
}