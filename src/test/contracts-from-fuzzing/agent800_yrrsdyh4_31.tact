contract ChainAssign {
    x: Int;
    y: Int;
    z: Int;

    init() {
        self.x = 1;
        self.y = self.x + 2;
        self.z = self.y + 3;
    }
}