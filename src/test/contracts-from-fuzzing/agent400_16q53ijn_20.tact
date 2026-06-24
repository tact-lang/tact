struct BoolInts {
    f1: Bool;
    f2: Int;
    f3: Int?;
}

contract MultiBools {
    a: Bool = false;
    b: Bool = true;
    c: Bool? = null;
    d: Bool? = null;
    s: BoolInts = BoolInts{ f1: false, f2: 3, f3: null };
    init() {}
}