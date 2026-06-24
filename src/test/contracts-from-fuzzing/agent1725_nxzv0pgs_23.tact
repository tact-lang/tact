contract TestContract {
    a: Int as uint16 = 0;
    b: Int as int16 = 0;
    c: Int as uint8 = 0;
    d: Int as int8 = 0;
    
    init() {
        self.a = 65535; // max uint16
        self.b = -32768; // min int16
        self.c = 255; // max uint8
        self.d = -128; // min int8
    }
}