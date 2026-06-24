contract PaddingOptionals {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;

    init() {
        self.a = null;
        self.b = null;
        self.c = 1;
        self.d = true;
    }
}