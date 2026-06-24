contract OptionalSerializeExplicit {
    x: Int? as int64 = null;
    y: Int? as int257 = null;

    init() {
        self.x = 123;
        self.y = -456;
    }
}
