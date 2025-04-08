struct Tiny {
    x: Int as uint4;
    y: Int as uint4;
}

contract ManyTinyValues {
    tiny: Tiny;
    init() {
        self.tiny = Tiny{x: 8, y: 9};
    }
}