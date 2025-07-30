contract NestedOptionalDefault {
    x: Int? = null;
    y: Bool? = true;
    s: String? = null;

    init() {
        self.x = 10;
        self.y = false;
        self.s = "str";
    }

    receive() {
        self.x = self.x;
    }
}