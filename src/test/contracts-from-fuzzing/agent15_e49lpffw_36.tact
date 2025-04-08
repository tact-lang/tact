// Optional bool serialization test
contract OptionalBool {
    a: Bool?;
    b: Bool?;

    init() {
        self.a = null;
        self.b = true;
    }
}