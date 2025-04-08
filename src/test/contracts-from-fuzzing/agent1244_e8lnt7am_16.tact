struct SDeep {
    i: Int;
}

struct M {
    s: SDeep;
}

contract ParamDeepNest(
    v: M
) {}
