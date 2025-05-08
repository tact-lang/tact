struct Bottom {
    val: Int = 42;
}

struct Middle {
    bottom: Bottom? = null;
}

struct Top {
    left: Middle? = null;
    right: Middle? = null;
}

contract DoubleOptionalStructs {
    t: Top = Top{};
}