struct Tiny {
    a: Int as uint4;
    b: Int as uint4;
}

contract TinyInts {
    tiny: Tiny;

    init() {
        self.tiny = Tiny{ a: 7, b: 8 };
    }

    receive() {
        self.tiny = self.tiny;
    }
}