struct Position {
    x: Int;
    y: Int?; // optional nested inside
}

struct Player {
    id: Int;
    pos: Position;
}

contract DeepOptStruct {
    data: Player = Player{id: 1, pos: Position{x: 0, y: null}};

    init() {
        self.data = Player{id:2, pos: Position{x:5, y:10}};
    }
}