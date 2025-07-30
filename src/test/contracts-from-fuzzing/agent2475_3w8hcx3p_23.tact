struct HasBytes {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as coins;
    e: Int;
}

contract SerializedInts {
    data: HasBytes;
    init() {
        self.data = HasBytes{ a:200, b:-30000, c:12345678, d:1000000000, e:42 };
    }
}