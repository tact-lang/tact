// Persist string+bool+int optional combo directly
contract OptCombo {
    so: String?;
    bo: Bool?;
    io: Int?;

    init() {
        self.so = null;
        self.bo = null;
        self.io = null;
    }
}
