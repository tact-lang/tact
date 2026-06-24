struct Level2 {
    z: Int;
}

struct Level1 {
    y: Level2;
}

struct Level0 {
    x: Level1;
}

contract DeepContract {
    data: Level0;

    init() {
        self.data = Level0{ x: Level1{ y: Level2{z: 42} } };
    }
}