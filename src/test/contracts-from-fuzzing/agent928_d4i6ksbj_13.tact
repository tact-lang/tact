contract SerializationFormats {
    a: Int as int64;
    b: Int as uint32;
    c: Bool;
    d: String;

    init() {
        self.a = -100;
        self.b = 123456;
        self.c = false;
        self.d = "hi";
    }
}