struct Level3 { a: Int; opt: String?; }
struct Level2 { x: Bool; l3: Level3; y: Int?; }
struct Level1 { z: Level2; s: String; }

contract VeryDeepNest {
    state: Level1;

    init() {
        self.state = Level1{
            z: Level2{
                x: true,
                l3: Level3{ a: 99, opt: null },
                y: null
            },
            s: "done"
        };
    }
}
