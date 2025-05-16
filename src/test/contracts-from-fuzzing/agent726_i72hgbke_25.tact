struct Coordinate {
    x: Int as int64;
    y: Int as int64;
}

contract Serializer {
    pos: Coordinate;

    init() {
        self.pos = Coordinate{ x: -1000, y: 1000 };
    }

    receive() {
        self.pos = self.pos;
    }
}