struct Lvl1 {
    next: Lvl2?;
}

struct Lvl2 {
    next: Lvl3?;
}

struct Lvl3 {
    next: Lvl4?;
}

struct Lvl4 {
    val: Int?;
}

contract Test {
    chain: Lvl1;

    init() {
        self.chain = Lvl1{ next: Lvl2{ next: null } };
    }
}