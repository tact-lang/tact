struct DefInner {
    v: Int = 42;
}

struct DefOuter {
    v2: DefInner = DefInner{};
}

contract DefAll {
    s: DefOuter = DefOuter{};
}