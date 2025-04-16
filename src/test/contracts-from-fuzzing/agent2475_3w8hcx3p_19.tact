struct Tiny {
    a: Int as uint8;
    b: Int as uint8;
}

contract SmallIntTypes {
    data: Tiny;
    init() {
        self.data = Tiny{ a: 255, b: 0 };
    }
}