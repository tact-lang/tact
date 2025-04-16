struct Coord {
    x: Int;
    y: Int;
}

contract ManyStructFields {
    s1: Coord;
    s2: Coord;
    s3: Coord;
    s4: Coord;
    s5: Coord;

    init() {
        self.s1 = Coord{x:1,y:1};
        self.s2 = Coord{x:2,y:2};
        self.s3 = Coord{x:3,y:3};
        self.s4 = Coord{x:4,y:4};
        self.s5 = Coord{x:5,y:5};
    }
}