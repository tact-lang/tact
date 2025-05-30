struct OptStrings {
    a: String?;
    b: String?;
    c: String?;
    d: String?;
}

contract ImplicitNulls {
    val: OptStrings;

    init() {
        self.val = OptStrings{};
    }

    receive() {}
}