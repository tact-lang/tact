struct InnerMost {
    v: Int = 88;
}

struct Middle {
    inn: InnerMost?;
}

struct Outer {
    mid: Middle? = null;
}

contract VeryDeepOpt {
    f: Outer;

    init() {
        self.f = Outer{};
    }
}