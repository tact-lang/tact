struct Level1 { a: Int }
struct Level2 { l1: Level1 }
struct Level3 { l2: Level2 }
struct Level4 { l3: Level3 }

contract VariedOrder {
    p: Int;
    q: Level4;
    r: Bool;

    init() {
        self.p = 0;
        self.q = Level4{ l3: Level3{ l2: Level2{ l1: Level1{ a: 7}}}};
        self.r = true;
    }
}