struct Sub {
    x: Int;
}

struct Middle {
    subOpt: Sub?;
}

struct Holder {
    midA: Middle?;
    midB: Middle?;
}

contract Test {
    h: Holder;

    init() {
        self.h = Holder{
            midA: null,
            midB: Middle{ subOpt: null },
        };
    }
}