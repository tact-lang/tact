struct Leaf {
    num: Int as uint64;
    extra: Cell as remaining;
}

struct Branch {
    leaf: Leaf;
    text: String;
    maybeVal: Int?;
}

struct Root {
    branch1: Branch;
    branch2: Branch?;
    simpleVal: Int;
}

contract MaximalComplex {
    a: Int?; b: Bool?; c: String?; d: Address?;
    e: Cell?; f: Int; g: Bool; h: String;
    nest: Root;

    init() {
        self.a = null; self.b = null; self.c = null; self.d = null;
        self.e = null; self.f = 1; self.g = true; self.h = "hi";
        self.nest = Root{
            branch1: Branch{
                leaf: Leaf{ num: 7, extra: emptyCell() },
                text: "branch one",
                maybeVal: null
            },
            branch2: null,
            simpleVal: 42
        };
    }
}