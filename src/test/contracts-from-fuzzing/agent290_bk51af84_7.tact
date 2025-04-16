struct Level3 { data: Int; }

struct Level2 { nested: Level3?; }

struct Level1 { nested: Level2?; }

contract Test {
    info: Level1;

    init() {
        self.info = Level1{
            nested: Level2{
                nested: null
            }
        };
    }
}