// Regression for optional persistent field with serialization override
contract OptSerialize {
    a: Int? as uint64;

    init() {
        self.a = null;
    }
}