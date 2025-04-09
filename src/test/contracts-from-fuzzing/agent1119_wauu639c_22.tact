// Mix of persistent fields with serialization and optional
contract SerializeAndOptional {
    a: Int as uint32;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;

    init() {
        self.a = 1234;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = "serialization";
        self.f = null;
    }
}