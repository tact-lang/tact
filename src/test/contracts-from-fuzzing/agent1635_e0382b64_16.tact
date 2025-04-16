struct Coord {
    x: Int;
    y: Int;
    z: Int;
}

struct Box {
    c1: Coord;
    c2: Coord;
}

contract BigNested {
    box: Box;

    init() {
        self.box = Box{c1: Coord{x:1,y:2,z:3}, c2: Coord{x:4,y:5,z:6}};
    }
}
