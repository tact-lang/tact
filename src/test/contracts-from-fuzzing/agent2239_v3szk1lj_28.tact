contract IntSerialization {
    x: Int as int8;
    y: Int as int64;

    init() {
        self.x = -5;
        self.y = -123456789;
    }
}