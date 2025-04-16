// Persistent state with complex optional and serialization combo
contract ComplexSerialization {
    a: Int? as uint32;
    b: Int as uint64;
    c: Bool?;

    init() {
        self.a = null;
        self.b = 42;
        self.c = null;
    }
}