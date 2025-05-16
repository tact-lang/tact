struct Coord {
    x: Int as int64;
    y: Int as int64;
}

contract SerializedFieldsStorage {
    point: Coord;

    init() {
        self.point = Coord{x:1,y:2};
    }
}