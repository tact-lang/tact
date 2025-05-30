contract NestedStructAndOpt {
    optStr: String?;
    str: String = "";

    init() {
        self.optStr = null;
        self.str = "abc";
    }
}
