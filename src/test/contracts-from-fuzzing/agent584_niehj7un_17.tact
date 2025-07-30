contract MixedSerializations {
    a: Int as uint8;
    b: Int?;
    c: Bool;
    d: String;

    init() {
        self.a = 255;
        self.b = 42;
        self.c = false;
        self.d = "serialized";
    }
}