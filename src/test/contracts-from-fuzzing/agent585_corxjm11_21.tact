struct Level1 {
    x: Int;
}
struct Level2 {
    y: Level1;
}
struct Level3 {
    z: Level2;
}

contract OptionalDeepLevelOption {
    optDeep: Level3?;

    init() {
        self.optDeep = Level3{ z: Level2{ y: Level1{ x: 11 } } };
    }
}
