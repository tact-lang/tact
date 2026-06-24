struct Level3 {
    flag: Bool;
}
struct Level2 {
    nested: Level3;
}
struct Level1 {
    nested: Level2;
}

contract DeepChain {
    data: Level1;
    init() {
        self.data = Level1{ nested: Level2{ nested: Level3{ flag:true }}};
    }
}