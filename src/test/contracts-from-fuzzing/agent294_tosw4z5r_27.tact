struct Level3 {
    x: Int = 1;
}

struct Level2 {
    l3: Level3 = Level3{};
}

struct Level1 {
    l2: Level2 = Level2{};
}

contract CascadeDefault {
    l1: Level1;

    init() {
        self.l1 = Level1{};
    }
}
