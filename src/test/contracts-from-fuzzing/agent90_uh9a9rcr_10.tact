struct BigNested {
    lvl1: Lvl1;
}

struct Lvl1 {
    lvl2: Lvl2;
}

struct Lvl2 {
    lvl3: Lvl3;
}

struct Lvl3 {
    lvl4: Lvl4;
}

struct Lvl4 {
    lvl5: Lvl5;
}

struct Lvl5 {
    lvl6: Lvl6;
}

struct Lvl6 {
    deepValue: Int;
}

contract DeeplyNested {
    obj: BigNested;
    init() {
        self.obj = BigNested{ lvl1: Lvl1{ lvl2: Lvl2{ lvl3: Lvl3{ lvl4: Lvl4{ lvl5: Lvl5{ lvl6: Lvl6{ deepValue: 999 } } } } } } };
    }
}