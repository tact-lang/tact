contract SerializeMix {
    a: Int as uint32;
    b: Bool;
    c: String;
    d: String?;
    e: Int? as int32;

    init() {
        self.a = 1234;
        self.b = true;
        self.c = "hi";
        self.d = null;
        self.e = null;
    }
}