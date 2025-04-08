struct Position {
    x: Int as int64;
    y: Int as int64;
}

struct Obj {
    pos: Position = Position{x: 11, y: 22};
    name: String = "obj";
}

contract NestedSerialized {
    data: Obj = Obj{};

    init() {}
}