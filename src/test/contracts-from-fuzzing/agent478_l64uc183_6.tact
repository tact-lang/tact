struct BoolFields {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
}

contract BitsPacking {
    bools: BoolFields = BoolFields{
        a: true, b: false, c: true, d: false, e: true, f: false, g: true, h: false
    };
}