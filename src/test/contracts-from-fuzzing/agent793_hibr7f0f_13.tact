struct Level3 {
    k: Int;
}
struct Level2 {
    l3: Level3;
}
struct Level1 {
    l2: Level2;
}
contract DeepThree {
    s: Level1;
    init() {
        self.s = Level1{l2: Level2{ l3: Level3{ k: 8 } }};
    }
}