contract MultipleTopFields {
    a: Int;
    b: Bool?;
    c: String;
    d: Slice?;
    e: Address?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = "";
        self.d = null;
        self.e = null;
    }
}