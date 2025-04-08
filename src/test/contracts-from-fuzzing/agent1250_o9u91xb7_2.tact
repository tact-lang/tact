struct Level3 { z: String?; }

struct Level2 { y: Bool; lvl3: Level3; }

struct Level1 { x: Int; lvl2: Level2; }

contract ThreeLevelNested {
    state: Level1;

    init() {
        self.state = Level1{
            x: 42,
            lvl2: Level2{
                y: true,
                lvl3: Level3{ z: "deep" }
            }
        };
    }
}