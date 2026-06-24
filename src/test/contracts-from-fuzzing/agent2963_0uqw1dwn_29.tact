contract FieldOrderSwap {
    b: Bool = true;
    i: Int = 42;
    s: String = "hi";
    bo: Bool?;
    io: Int?;
    so: String?;

    init() {
        self.bo = false;
        self.io = null;
        self.so = "x";
    }
}