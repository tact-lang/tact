contract Test {
    large_default: Int = 123456789123456789;
    str_default: String = "A very long default string with many many characters just to check what happens when defaults are long in source code";
    bool_default: Bool = true;

    init() {
        self.large_default = 999999999;
        self.str_default = "Changed";
        self.bool_default = false;
    }
}