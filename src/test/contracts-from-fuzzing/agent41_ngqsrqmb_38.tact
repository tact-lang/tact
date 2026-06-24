// Optional primitive serialized explicitly
contract OptPrimitiveSerialize {
    a: Int? as int64;
    b: Bool?;
    c: String?;
    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}