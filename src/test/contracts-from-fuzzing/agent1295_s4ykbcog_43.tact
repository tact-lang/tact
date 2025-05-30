// optional primitives with explicit serialization
contract OptPrimSerial {
    a: Int? as uint8;
    b: Int? as int16;
    c: Bool?;

    init() {
        self.a = null;
        self.b = -32;
        self.c = true;
    }
}