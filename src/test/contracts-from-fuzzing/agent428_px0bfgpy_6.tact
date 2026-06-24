contract OptionalPrimitives {
    x: Int?;
    y: Bool?;
    z: String?;
    a: Address?;
    b: Cell?;
    c: Slice?;

    init() {
        self.x = null;
        self.y = true;
        self.z = "hi";
        self.a = null;
        self.b = emptyCell();
        self.c = emptyCell().asSlice();
    }
}
