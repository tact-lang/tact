struct Coord {
    x: Int as int64;
    y: Int as int64;
}

contract SingleDeepNested {
    pos: Coord;
    
    init() {
        self.pos = Coord{ x: 10, y: -10 };
    }
}