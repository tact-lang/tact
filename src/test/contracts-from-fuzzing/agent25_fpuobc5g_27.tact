// combining several optional fields with default null
contract Test {
    x: Int?;
    y: Bool?;
    z: String?;
    a: Address?;
    c: Cell?;
    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.a = null;
        self.c = null;
    }
}