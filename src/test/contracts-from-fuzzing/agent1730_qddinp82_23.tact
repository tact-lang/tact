struct Lvl3 { v: Int; }
struct Lvl2 { l3: Lvl3; }
struct Lvl1 { l2: Lvl2; }

contract DiffNamesNested {
    top: Lvl1;

    init() {
        self.top = Lvl1{ l2: Lvl2{ l3: Lvl3{ v: 99 } } };
    }
}