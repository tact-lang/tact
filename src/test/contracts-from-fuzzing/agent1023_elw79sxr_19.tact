contract OptionalVarsContract {
    x: Int? = null;
    y: Bool? = null;
    z: Address? = null;
    s: String? = null;
    cl: Cell? = null;
    sl: Slice? = null;

    init() {
        self.x = 1;
        self.y = true;
        self.z = null;
        self.s = "test";
        self.cl = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}