struct Coord {
    x: Int;
    y: Int;
}

contract NestedMembers {
    topLeft: Coord;
    bottomRight: Coord;
    label: String;

    init() {
        self.topLeft = Coord{x:0,y:0};
        self.bottomRight = Coord{x:100,y:100};
        self.label = "rect";
    }
}
