struct Tiny {
    x: Int as uint4;
    y: Int as int8;
}

contract TestContract {
    tiny: Tiny;

    init() {
        self.tiny = Tiny{x: 5, y: -5};
    }
}