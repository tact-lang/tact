// Testing serialization edge cases with negative serialization boundaries
contract NegSerialize {
    a: Int as int8;
    b: Int as int16;

    init() {
        self.a = -128;  // min int8
        self.b = -32768; // min int16
    }
}