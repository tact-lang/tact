struct Level3 {
    num: Int = 3;
}
struct Level2 {
    l3: Level3;
}
struct Level1 {
    l2: Level2;
}

contract TestContract {
    one: Level1;
    two: Level1;

    init() {
        self.one = Level1{ l2: Level2{ l3: Level3{ num: 11 } } };
        self.two = Level1{ l2: Level2{ l3: Level3{ num: 22 } } };
    }
}