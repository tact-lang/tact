struct DeepInside {
    f0: Int;
    f1: Bool;
}

struct MidLevel {
    a: DeepInside;
    b: Int?;
    c: String?;
}

contract LayeredStorage {
    m1: MidLevel;
    m2: MidLevel?;
    i: Int;
    s: String;

    init() {
        self.m1 = MidLevel{
            a: DeepInside{f0: 42, f1: true},
            b: null,
            c: null
        };
        self.m2 = null;
        self.i = 0;
        self.s = "";
    }
}