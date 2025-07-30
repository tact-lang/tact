message(0x1) M { p: Int = 12; }

struct Wrap {
    m: M = M{};
}

contract TestContract {
    w: Wrap;

    init() {
        self.w = Wrap{};
    }

    receive() {}
}