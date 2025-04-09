struct SerializationDemo {
    a: Int as int8;
    b: Int as uint4;
    c: Int as int16;
}

contract SerializeSizes {
    d: SerializationDemo;
    init() {
        self.d = SerializationDemo{ a: -3, b: 5, c: 1234 };
    }
}