struct Level2 {
    x: Int;
    y: Bool;
}

struct Level1 {
    pos: Level2;
    name: String;
}

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            pos: Level2{ x: 10, y: false },
            name: "deep"
        };
    }
}