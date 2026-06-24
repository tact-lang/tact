contract MixedTypes {
    i: Int = 1;
    b: Bool = true;
    s: String = "test";
    io: Int?; // nullable int
    bo: Bool?; // nullable bool
    so: String?; // nullable string
    i32: Int as uint32 = 123;
    i64: Int as int64 = -456;

    init() {
        self.io = null;
        self.bo = null;
        self.so = null;
    }
}
