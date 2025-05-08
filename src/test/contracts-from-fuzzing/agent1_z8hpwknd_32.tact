struct In1 {
    x: Int as int64;
}
struct In2 {
    y: Int as uint32;
}

contract SerializedFields {
    a: Int as uint8;
    b: Int as int16;
    inner1: In1;
    inner2: In2;

    init() {
        self.a = 12;
        self.b = 1234;
        self.inner1 = In1{ x: 123 }; 
        self.inner2 = In2{ y: 456 };
    }
}