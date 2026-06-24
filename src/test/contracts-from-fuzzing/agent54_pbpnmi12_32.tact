contract OptionalSerializable2 {
    x: Int? as uint4;

    init() {
        self.x = 2;
        self.x = null;
    }
}