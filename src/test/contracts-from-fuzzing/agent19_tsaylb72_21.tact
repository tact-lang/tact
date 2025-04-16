contract ManyPrimitiveSizes {
    a: Int as int8;
    b: Int as int16;
    c: Int as int32;
    d: Int as int64;
    e: Int as int128;
    f: Int;
    x: Bool;
    y: Bool;
    s: String;

    init() {
        self.a = 0;
        self.b = 1;
        self.c = 2;
        self.d = 3;
        self.e = 4;
        self.f = 5;
        self.x = true;
        self.y = false;
        self.s = "str";
    }
}
