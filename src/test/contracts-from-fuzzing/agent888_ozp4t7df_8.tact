struct Level4 { a: Int; b: Bool?; c: String; }
struct Level3 { l4a: Level4; l4b: Level4; }
struct Level2 { l3: Level3; note: String?; }
struct Level1 { l2: Level2; flag: Bool; }

contract FourLevels {
    state: Level1;

    init() {
        self.state = Level1{
            l2: Level2{
                l3: Level3{
                    l4a: Level4{ a:1, b: null, c:"x" },
                    l4b: Level4{ a:2, b: true, c:"y" },
                },
                note: null,
            },
            flag: false,
        };
    }
}