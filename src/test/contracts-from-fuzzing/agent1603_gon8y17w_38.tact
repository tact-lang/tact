struct Small {
    a: Int;
    b: Int;
}

struct Large {
    a: Small;
    b: Small;
    c: Small;
    d: Small;
    e: Small;
    f: Small;
}

contract ParamStructLarge(
    big: Large
) {
    receive() {}
}