struct Serializable {
    a: Int as int8;
    b: Int as uint4;
}

contract SerialFormatsTest {
    s: Serializable;

    init() {
        self.s = Serializable{ a: 7, b: 8 };
    }
}