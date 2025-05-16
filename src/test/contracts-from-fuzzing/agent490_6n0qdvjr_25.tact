struct Consts {
    one: Int = 1;
    two: Int = 2;
    three: Int = 3;
}

contract Defaults {
    c: Consts;
    init() {
        self.c = Consts{};
    }
}