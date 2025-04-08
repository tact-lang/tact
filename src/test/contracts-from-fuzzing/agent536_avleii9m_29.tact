struct Position {
    x: Int;
    y: Int?;
}

struct Player {
    id: Int;
    pos: Position;
    name: String?;
}

contract ComplexParam(
    player: Player,
) {}