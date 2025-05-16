struct Level2 {
    z: Int;
    flag: Bool;
}

struct Level1 {
    x: Int;
    y: Level2;
}

contract DeepNest {
    store: Level1;
    
    init() {
        self.store = Level1{ x: 55, y: Level2{ z: 77, flag: true } };
    }
}