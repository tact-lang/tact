struct Lvl3 {
    a: Int;
}

struct Lvl2 {
    nested: Lvl3;
}

struct Lvl1 {
    nested: Lvl2;
}

contract MultiNest {
    f: Lvl1 = Lvl1{nested: Lvl2{nested: Lvl3{a: 0}}};

    init() {
        self.f = Lvl1{nested: Lvl2{nested: Lvl3{a: 100}}};
    }
}
