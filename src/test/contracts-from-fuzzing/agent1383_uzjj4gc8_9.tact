struct Combo {
    p: Pair;
    q: Pair?;
}

struct Pair {
    f: Int;
    g: Int;
}

contract ComboStruct {
    comb: Combo;
    opt: Pair?;

    init() {
        self.comb = Combo{
            p: Pair{ f: 1, g: 2 },
            q: null
        };
        self.opt = null;
    }
}