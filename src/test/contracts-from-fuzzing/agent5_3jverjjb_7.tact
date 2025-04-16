struct Level3 { x3: Int; y3: Bool; }
struct Level2 { x2: Int?; y2: Level3; }
struct Level1 { x1: Bool?; y1: Level2?; }

contract OptionalNest {
    data: Level1;

    init() {
        self.data = Level1{
            x1: null,
            y1: null,
        };
    }
    
    receive() {
        let _ = self.data;
    }
}