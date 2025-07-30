struct InlineDefault {
    a: Int = 1;
    b: Bool = false;
    s: String = "str";
    o: Int? = null;
}

contract Test {
    val: InlineDefault;

    init() {
        self.val = InlineDefault{};
    }
}