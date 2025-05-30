contract OverlappingTypes {
    x: Int as int64;
    y: Int as int64;
    z: Int as uint64;
    init() {
        self.x = -10;
        self.y = 20;
        self.z = 30;
    }
}