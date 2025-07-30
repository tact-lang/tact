struct Lvl4 {
    f: Int;
}

struct Lvl3 {
    l4: Lvl4;
}

struct Lvl2 {
    l3: Lvl3;
}

struct Lvl1 {
    l2: Lvl2;
}

contract FourDeep {
    data: Lvl1;

    init() {
        self.data = Lvl1{ l2: Lvl2{ l3: Lvl3{ l4: Lvl4{ f: 7 } } } };
    }
}