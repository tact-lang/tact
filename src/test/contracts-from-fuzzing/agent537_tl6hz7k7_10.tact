contract TestContract {
    field1: Int as int8;
    field2: Int as uint8;

    init() {
        self.field1 = 127;
        self.field2 = 255;
    }

    receive() {
        self.field1 = -128;  // min int8
        self.field2 = 0;     // min uint8
    }
}
