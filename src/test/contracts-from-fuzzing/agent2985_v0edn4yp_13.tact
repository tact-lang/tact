struct Ints {
    a: Int as int8;
    b: Int as int16;
    c: Int as int32;
    d: Int as int64;
    e: Int as int128;
    f: Int; // default 257
}

contract SerializedInts {
    ints: Ints;

    init() {
        self.ints = Ints{ a:1,b:2,c:3,d:4,e:5,f:6 };
    }
}
