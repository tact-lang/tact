struct SerialInt {
    a: Int as uint4;
    b: Int as int8;
}

contract SerialInts {
    ser: SerialInt;

    init() {
        self.ser = SerialInt{
            a: 1,
            b: -5,
        };
    }
}