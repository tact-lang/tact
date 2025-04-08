contract SerializeTest {
    a: Int as uint8;    // range 0..255
    b: Int as int16;   // range -32768..32767
    c: Int as coins;   // coin amount

    init() {
        self.a = 42;
        self.b = -12345;
        self.c = ton("1");
    }
}