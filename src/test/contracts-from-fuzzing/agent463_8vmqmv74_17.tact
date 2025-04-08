struct Level2 {
    x: Int;
    y: Bool?;
}

struct Level1 {
    inner: Level2;
    z: String?;
}

contract DeepNest {
    payload: Level1;

    init() {
        self.payload = Level1{ inner: Level2{ x: 10, y: null }, z: null };
    }
}