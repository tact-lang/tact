struct Level2 {
    x: Int;
    y: Bool;
}

struct Level1 {
    p: Level2;
    q: String;
}

contract Test {
    v: Level1;

    init() {
        self.v = Level1{
            p: Level2{ x: 4, y: false },
            q: "hi"
        };
    }
}