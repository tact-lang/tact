struct Lvl3 {
    a: Int;
}

struct Lvl2 {
    b: Lvl3;
}

struct Lvl1 {
    c: Lvl2;
}

contract DeepNestOptional {
    opt: Lvl1?;

    init() {
        self.opt = null;
    }
}