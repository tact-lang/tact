contract OptionalPacked {
    x: Int? as uint8;
    y: Int? as uint32;
    z: Int? as int64;
    flag: Bool?;
    init() {
        self.x = null;
        self.y = null;
        self.z = null;
        self.flag = null;
    }
}