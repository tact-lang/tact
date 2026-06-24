contract PersistentOptionals {
    x: Int?;
    y: String?;
    z: Bool?;
    a: Slice?;
    b: Cell?;
    c: Address?;
    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.a = null;
        self.b = null;
        self.c = null;
    }
}
