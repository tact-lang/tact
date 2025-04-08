struct Level4 { val: Int?; }

struct Level3 { l4: Level4; }

struct Level2 { l3: Level3; more: Bool?; }

struct Level1 { l2: Level2; extra: String = ""; }

contract DeepNest {
    x: Level1;

    init() {
        self.x = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{ val: 999 }
                },
                more: true
            },
            extra: "deep"
        };
    }
}
