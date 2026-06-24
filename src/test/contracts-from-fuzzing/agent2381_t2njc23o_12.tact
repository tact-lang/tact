struct Bottom {
    foo: Int = 5;
}

struct Middle {
    b: Bottom = Bottom{};
}

struct Top {
    m: Middle = Middle{};
}

contract TestContract {
    data: Top = Top{};

    init() {}
}