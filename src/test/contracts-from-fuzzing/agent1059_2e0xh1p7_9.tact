struct Level3 { a: Int; }

struct Level2 { nested: Level3; b: Int?; }

struct Level1 { nested: Level2; s: String?; }

contract TestContract {
    data: Level1;

    init() {
        self.data = Level1{
            nested: Level2{
                nested: Level3{a: 77},
                b: null
            },
            s: null
        };
    }
}