// param type contract deeply nested
struct Bottom {
    x: Int;
}

struct Middle {
    bottom: Bottom;
}

struct Top {
    middle: Middle;
}

contract ParamDeepNested(
    t: Top,
) {}