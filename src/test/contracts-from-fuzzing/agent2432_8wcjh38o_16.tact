contract Test {
    text: String = "Hello";
    optText: String? = null;
    num: Int = 123;
    flag: Bool = true;
    init() {
        self.optText = "World";
    }
}