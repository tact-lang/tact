contract SerializeInline {
    a: Int as uint4 = 5;
    b: Int as int4 = -3;
    c: Int as uint8 = 10;
    d: Int as int8 = -10;

    receive() {
        self.a = self.a;
    }
}