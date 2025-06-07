struct Details {
    a: Int as uint32;
    b: Bool?;
}

contract Test {
    info: Details?;

    init() {
        self.info = Details{ a: 99, b: null };
    }
}