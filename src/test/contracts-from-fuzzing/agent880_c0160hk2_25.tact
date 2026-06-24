contract OptSerialize {
    x: Int? as uint4;
    y: Int? as int64;

    init() {
        self.x = 3;
        self.y = null;
    }
}