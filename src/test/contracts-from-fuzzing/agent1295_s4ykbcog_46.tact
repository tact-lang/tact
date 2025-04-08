// Deep optional field explicit null on init with explicit serialization
contract ExplicitNullSerial {
    x: Int? as uint32;

    init() {
        self.x = null;
    }
}