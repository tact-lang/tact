struct Position {
    x: Int;
    y: Int = 10;
}

struct Player {
    name: String = "Alice";
    pos: Position;
    alive: Bool = true;
}

contract DeepNestedDefaults {
    state: Player;

    init() {
        self.state = Player{
            pos: Position{
                x: 42,
            },
        };
    }
}