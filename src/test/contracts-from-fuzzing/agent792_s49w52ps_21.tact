contract OptSerialize {
    a: Int? as uint4;
    b: Bool?;

    init() {
        self.a = null;
        self.b = null;
    }
}