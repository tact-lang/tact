// Optional bool serialization with explicit bit size
contract OptionalBoolSerialize {
    a: Bool?; 
    b: Bool?;

    init() {
        self.a = null;
        self.b = false;
    }
}