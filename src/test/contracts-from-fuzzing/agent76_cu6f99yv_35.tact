contract NestedUintContract {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
    init() {
        self.a=255; self.b=65535; self.c=4294967295; self.d=18446744073709551615;
    }
}