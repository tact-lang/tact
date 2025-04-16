struct SerialInt {
    x: Int as uint32;
    y: Int as int8;
}

contract SerialContract {
    ser: SerialInt;

    init() {
        self.ser = SerialInt{ x: 123, y: -5 };
    }
}