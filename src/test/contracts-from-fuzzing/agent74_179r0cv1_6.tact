struct Level2 {
    x: Int;
    y: Bool;
}

struct Level1 {
    a: Int;
    nested: Level2;
}

contract DeepNest {
    payload: Level1;

    init() {
        self.payload = Level1{
            a: 17,
            nested: Level2{ x: 23, y: true }
        };
    }
}