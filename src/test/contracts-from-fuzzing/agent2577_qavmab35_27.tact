contract FieldSerialize {
    a: Int as uint32;
    b: Int as int64;
    c: Int as coins;

    init() {
        self.a=4294967295;
        self.b=-1234567;
        self.c=ton("5");
    }
}
