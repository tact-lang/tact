contract OptFields {
    u: Int?;          // no initializer; should be null
    v: Bool? = null; // explicit null
    w: String?;      // no initializer
    x: Address? = null;
    y: Cell?;        // no initializer

    init() {
        self.u = 1;
        self.v = true;
        self.w = "abc";
        self.x = null;
        self.y = emptyCell();
    }

    receive() {}
}