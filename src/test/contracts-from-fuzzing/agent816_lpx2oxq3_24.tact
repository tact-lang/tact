contract Initializer {
    x: Int;
    y: Int;
    z: Int;

    init() {
        self.x = 1;
        self.y = 2;
        self.z = self.x + self.y;
    }
}
