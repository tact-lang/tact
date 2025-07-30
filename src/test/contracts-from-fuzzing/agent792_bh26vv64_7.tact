struct Tiny {
    t: Int as uint4;
}

struct WrapTiny {
    inner: Tiny;
}

contract TestContract {
    w: WrapTiny;

    init() {
        self.w = WrapTiny{ inner: Tiny{ t: 7 } };
    }
}