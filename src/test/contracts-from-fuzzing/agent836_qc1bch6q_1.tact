struct Coord {
    x: Int;
    y: Int;
}

contract Test {
    pos: Coord;
    
    init() {
        self.pos = Coord{ x:1, y:2 };
    }
}