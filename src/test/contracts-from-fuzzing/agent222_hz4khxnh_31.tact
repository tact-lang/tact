contract OptionalsOverlap {
    x: Int?;
    y: Int?;
    z: Int = 1;
    t: Int?;

    receive() {
        self.x = 5;
        self.y = null;
        self.z = 55;
        self.t = 7;
    }
}