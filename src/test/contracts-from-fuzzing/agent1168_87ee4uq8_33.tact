contract SerializationEdge {
    tinyInt: Int as int1;
    hugeInt: Int as int257;

    init() {
        self.tinyInt = 1;
        self.hugeInt = -123456789;
    }
}