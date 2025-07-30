contract OnlyPrimitives {
    x: Int = 1;
    y: Bool = true;
    z: String = "abc";

    init() {
        self.x = 2;
        self.y = false;
        self.z = "def";
    }
}