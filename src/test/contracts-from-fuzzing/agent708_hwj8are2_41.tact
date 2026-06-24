struct Ints {
    a: Int;
    b: Int;
    c: Int;
}

struct Bools {
    x: Bool;
    y: Bool;
}

struct Strings {
    s1: String;
    s2: String;
}

contract MultiGroup {
    ints: Ints;
    bools: Bools;
    strs: Strings;

    init() {
        self.ints = Ints{ a:1, b:2, c:3 };
        self.bools = Bools{ x:true, y:false };
        self.strs = Strings{ s1:"abc", s2:"def" };
    }
}