struct Serial {
    a: Int as uint8;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint16;
}

contract SerialContract {
    s: Serial;

    init() {
        self.s = Serial{ a:255,b:255,c:65000,d:65000 };
    }
}