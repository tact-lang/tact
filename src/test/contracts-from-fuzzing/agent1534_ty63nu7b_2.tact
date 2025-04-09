struct Coord {
    x: Int;
    y: Int;
}

contract EmbedStruct {
    coord: Coord;
    init() {
        self.coord = Coord{x: 10, y: 20};
    }
}