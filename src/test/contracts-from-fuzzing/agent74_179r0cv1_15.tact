struct Serialized {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Bool;
}

contract TestContract {
    st: Serialized;

    init() {
        self.st = Serialized{ a: 255, b: -30000, c: 100000, d: true };
    }
}