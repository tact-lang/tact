contract ReorderInit {
    x: Int as uint32;
    y: Int as int64;
    z: Int;

    init() {
        self.z = 1;
        self.x = 10;
        self.y = -20;
    }
}