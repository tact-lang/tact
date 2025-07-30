contract AliasTest {
    x: Int as int64;
    y: Int as uint64;
    s: String;
    b: Bool;

    init() {
        self.x = -123456789;
        self.y = 123456789;
        self.s = "hi";
        self.b = true;
    }
}