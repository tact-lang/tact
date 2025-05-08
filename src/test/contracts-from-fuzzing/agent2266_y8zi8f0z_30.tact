contract Test{
    a: Int = 1;
    b: Int?;
    c: String = "hi";
    d: String?;

    init() {
        self.b = -10;
        self.d = null;
    }
}