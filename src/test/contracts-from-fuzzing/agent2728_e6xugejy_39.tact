contract Test {
    str: String?;

    init() {
        self.str = null;
    }

    get fun getStr(): String? {
        return self.str;
    }
}
