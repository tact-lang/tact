struct Bottom {
    v: Int = 99;
}

struct Middle {
    bottomOpt: Bottom? = Bottom{};
}

struct TopMost {
    midOpt: Middle? = Middle{};
}

contract RecursiveDefaultOpt {
    foo: TopMost = TopMost{};
}