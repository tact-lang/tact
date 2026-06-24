struct Serial {
    a: Int as uint64;
    b: Int as uint32;
    c: Int;
    d: Int;
}

contract SerialMix {
    state: Serial;

    init() {
        self.state = Serial{ a:1, b:2, c:3, d:4 };
    }
}