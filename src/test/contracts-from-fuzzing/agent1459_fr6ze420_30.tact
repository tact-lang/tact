// Mix of contracts fields with serialization annotation and default values
contract SerDefaults {
    a: Int as uint16 = 42;
    b: Bool = true;

    init() {
        self.a = 255;
        self.b = false;
    }
}