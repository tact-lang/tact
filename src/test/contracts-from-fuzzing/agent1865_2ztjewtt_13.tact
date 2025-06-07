contract SerialIntWidths {
    a: Int as int8;
    b: Int as int16;
    c: Int as int32;
    d: Int as int64;
    e: Int as int128;
    f: Int;

    init() {
        self.a=0; self.b=0; self.c=0; self.d=0; self.e=0; self.f=0;
    }
}