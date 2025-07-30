contract MixSerialization {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
    d: Int; // defaults to int257

    init() {
        self.a=5;
        self.b=-1000;
        self.c=99999;
        self.d=123456789;
    }
}