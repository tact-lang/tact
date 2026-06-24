// Many serialization options on persistent fields
contract SerializedMany {
    a: Int as int64;
    b: Int as uint64;
    c: Int as int8;
    d: Int as uint8;
    e: Int as int16;
    f: Int as uint16;
    g: Int as coins;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4; self.e=5; self.f=6; self.g=7;
    }
}