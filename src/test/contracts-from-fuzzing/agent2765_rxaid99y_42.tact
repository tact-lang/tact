contract SequentialNull {
    a: Int?;
    b: Int?;
    c: Int?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = 2;
        self.b = 3;
    }
}