contract Test {
    x: Int? = null;
    y: Bool? = null;
    z: Int? = null;

    init() {
        self.x = 5;
        self.y = true;
        self.z = null;
    }

    receive() {
        self.y = false;
    }
}