struct SerialDefaultsMix {
    a: Int as uint8 = 5;
    b: Int as int16 = -100;
    c: Bool = true;
    d: String = "hello";
}

contract DefaultsSerializationFields {
    ser: SerialDefaultsMix;

    init() {
        self.ser = SerialDefaultsMix{};
    }
}