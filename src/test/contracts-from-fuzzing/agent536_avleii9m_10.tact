struct Point {
    x: Int;
    y: Int;
}

struct Player {
    id: Int;
    pos: Point;
}

contract DeepStruct {
    data: Player = Player{id: 1, pos: Point{x: 0, y: 0}};

    init() {
        self.data = Player{id: 2, pos: Point{x: 10, y: 20}};
    }
}