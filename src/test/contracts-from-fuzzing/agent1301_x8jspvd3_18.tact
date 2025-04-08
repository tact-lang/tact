struct SerializeDemo {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint4;
    d: Int as coins;
}

contract TestContract {
    s: SerializeDemo;
    init() {
        self.s = SerializeDemo{ a:10, b:-5, c:7, d:999 };
    }
}