contract Serializations {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int128;
    e: Int as coins;

    init() {
        self.a=1; self.b=-5; self.c=100; self.d=-1; self.e=ton("1");
    }
}