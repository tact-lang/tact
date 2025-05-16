struct Leaf {
    v: Int = 99;
    f: Bool = false;
}

struct Stem {
    leafOpt: Leaf?;
    txt: String = "default";
}

struct Root {
    stemOpt: Stem?;
    cnt: Int as uint64 = 1000;
}

contract Test(
    root: Root,
    flag: Bool,
) {
    receive() {}
}