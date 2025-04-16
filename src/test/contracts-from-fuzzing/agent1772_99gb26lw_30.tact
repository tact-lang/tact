struct Shorty {
    a: Int as uint8;
    b: Int as uint8;
    c: Int as uint8;
}

contract Test30 {
    s: Shorty;

    init() {
        self.s = Shorty{ a:1,b:2,c:3 };
    }
}