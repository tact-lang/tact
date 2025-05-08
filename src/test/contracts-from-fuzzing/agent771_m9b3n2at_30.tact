contract MaxSerializationFields {
    a: Int as uint248;
    b: Int as uint8;
    c: Int as int128;
    d: Int as int1;
    e: Int as uint4;
    f: Int as coins;

    init() {
        self.a=0;
        self.b=1;
        self.c=2;
        self.d=0;
        self.e=15;
        self.f=ton("1");
    }
}