contract AllOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
    c: Cell?;

    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.c = null;
    }
}