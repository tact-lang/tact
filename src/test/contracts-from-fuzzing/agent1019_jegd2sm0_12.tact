struct Deep {
    x: Int = 5;
    y: Bool?;
}

struct Wrap {
    deep: Deep = Deep{};
}

contract TestContract {
    wrap: Wrap? = null;

    init() {}
}