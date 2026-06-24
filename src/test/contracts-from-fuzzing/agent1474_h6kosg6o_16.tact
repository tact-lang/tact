contract BoolIntStrings {
    flag: Bool = true;
    count: Int = 42;
    name: String = "abc";
    textOpt: String? = null;

    init() {
        self.textOpt = "hello";
    }
}
