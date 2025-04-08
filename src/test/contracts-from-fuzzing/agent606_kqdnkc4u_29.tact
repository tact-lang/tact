struct Bottom {
    x: Int as int32;
    y: Bool;
}

struct Mid {
    node: Bottom;
    flag: Bool;
}

struct Top {
    root: Mid;
}

contract Test {
    t: Top = Top{ root: Mid{ node: Bottom{ x: 0, y: false }, flag: true } };
}