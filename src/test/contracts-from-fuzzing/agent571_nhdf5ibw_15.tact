struct Tiny {
    a: Int as int1;
    b: Int as uint1;
}

contract TestContract {
    tiny: Tiny;

    init() {
        self.tiny = Tiny{a: 1, b: 1};
    }
}