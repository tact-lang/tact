struct Coord {
    x: Int;
    y: Int;
}

contract ArrayLike {
    p1: Coord;
    p2: Coord;
    p3: Coord;
    p4: Coord;

    init() {
        self.p1 = Coord{x:1,y:1};
        self.p2 = Coord{x:2,y:2};
        self.p3 = Coord{x:3,y:3};
        self.p4 = Coord{x:4,y:4};
    }
}