contract TestReordered {
    x: Int;
    y: Int as uint32;
    z: Int as int16;
    b: Bool;

    init() {
        self.x = 1;
        self.y = 2;
        self.z = 3;
        self.b = true;
    }
}