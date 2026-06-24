contract FieldOrderContract {
    a: Int as uint8;
    b: Int as int16;
    c: Int;
    d: Bool;
    e: String;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
        self.d = true;
        self.e = "four";
    }
}