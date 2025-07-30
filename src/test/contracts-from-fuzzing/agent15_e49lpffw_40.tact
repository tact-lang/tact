// Nullable fields at root of contract with serialization
contract NullableSerialized {
    a: Int? as uint8;
    b: Int? as int9;
    c: Bool?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}