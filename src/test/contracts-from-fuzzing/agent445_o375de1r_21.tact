// Deep optional nested defaults
struct Leaf {
    x: Int? = null;
}

struct Mid {
    nest: Leaf? = null;
}

struct Top {
    sub: Mid? = null;
}

contract MultiOptionalDefaults {
    persistent: Top = Top{};
}
