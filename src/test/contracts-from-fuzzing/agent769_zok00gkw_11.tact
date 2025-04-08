struct SerialTypes {
    a: Int as uint8;
    b: Int as uint32;
    c: Int as int64;
}

contract TestContract {
    s: SerialTypes;

    init() {
        self.s = SerialTypes{
            a: 255,
            b: 123456,
            c: -123456789,
        };
    }

    receive() {
        let _ = self.s.c + 1;
    }
}