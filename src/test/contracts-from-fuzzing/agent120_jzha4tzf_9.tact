struct Level4 { val: String; }
struct Level3 { deep: Level4; }
struct Level2 { deeper: Level3; }
struct Level1 { deepest: Level2; }

contract VeryDeep {
    data: Level1;

    init() {
        self.data = Level1{
            deepest: Level2{
                deeper: Level3{
                    deep: Level4{ val: "bottom" }
                }
            }
        };
    }
}