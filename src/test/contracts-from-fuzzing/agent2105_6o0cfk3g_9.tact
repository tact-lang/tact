contract OptionalFields {
    x: Int?;
    y: Bool?;
    z: Address?;
    t: Cell?;

    init() {
        self.x = 42;
        self.y = null;
        self.z = null;
        self.t = emptyCell();
    }
}