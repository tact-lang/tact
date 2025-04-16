struct Sizes {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
}

contract TestContract {
    s: Sizes = Sizes{ a:1, b:2, c:3 };

    init() {
        self.s = Sizes{ a:4, b:5, c:6 };
    }
}