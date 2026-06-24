struct AlmostEmpty {
    x: Int;
}

contract WithAlmostEmpty {
    data: AlmostEmpty = AlmostEmpty{ x: 0 };

    init() {}
}
