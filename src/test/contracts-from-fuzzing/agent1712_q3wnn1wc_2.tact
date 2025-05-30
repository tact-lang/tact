struct DeepNested {
    coord: Coord;
    label: String;
}

struct Coord {
    x: Int;
    y: Int;
}

contract DeepNestedTest {
    pointData: DeepNested;
    
    init() {
        self.pointData = DeepNested{
            coord: Coord{ x: 1, y: 2 },
            label: "origin"
        };
    }
}