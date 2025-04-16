struct S {
    x: Int;
    y: Bool;
}

contract Mixed {
    i: Int = 0;
    b: Bool = true;
    s: S = S{x: 1, y: false};

    init() {}
}