// Long list of int fields with explicit serialization

contract LongInts {
    a: Int as int8;
    b: Int as int16;
    c: Int as int32;
    d: Int as int64;
    e: Int as int128;
    f: Int as int256;
    g: Int as int257;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = 6;
        self.g = 7;
    }
}
