// Optional fields with explicit serialization sizes
contract Test {
    x: Int? as int8;

    init() {
        self.x = null;
    }
}