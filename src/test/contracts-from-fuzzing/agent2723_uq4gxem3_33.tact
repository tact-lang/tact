struct SimpleS {
    a: Int;
}

struct WrapS {
    s: SimpleS?;
}

contract WrapperOpt {
    w: WrapS;
    init() {
        self.w = WrapS{ s: null };
    }
}