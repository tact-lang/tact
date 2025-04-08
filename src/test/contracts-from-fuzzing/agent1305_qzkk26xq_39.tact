struct SerialMix {
    a: Int as uint8;
    b: Int as int64;
    c: Int;
    d: Bool;
}

contract SerialContract {
    data: SerialMix;

    init() {
        self.data = SerialMix{ a: 1, b: 2, c: 3, d: true };
    }
}