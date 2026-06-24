struct Level3 {
    p: Int;
}
struct Level2 {
    c: Level3;
}
struct Level1 {
    b: Level2;
}
contract DeepChain {
    nested: Level1 = Level1{b: Level2{c: Level3{p: 123}}};
    init() {
        self.nested = Level1{b: Level2{c: Level3{p: 456}}};
    }
}