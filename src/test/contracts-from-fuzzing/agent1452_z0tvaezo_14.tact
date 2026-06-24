struct Level3 {
    z: Int;
}

struct Level2 {
    y: Level3;
}

struct Level1 {
    x: Level2;
}

contract ChainedStructs {
    item: Level1;

    init() {
        self.item = Level1{ x: Level2{ y: Level3{z: 8} } };
    }
}