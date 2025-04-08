contract OptionalMix {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;
    d: Address? = null;
    e: Cell? = null;
    init() {
        self.a = 10;
        self.c = "hi";
    }
    receive() {}
}