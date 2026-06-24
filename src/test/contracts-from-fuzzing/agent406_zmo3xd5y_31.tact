struct Level4 { d: Int; }
struct Level3 { c: Level4; }
struct Level2 { b: Level3; }
struct Level1 { a: Level2; }

contract AssignDeeper {
    val: Level1;

    init() {
        self.val = Level1{
            a: Level2{
                b: Level3{
                    c: Level4{ d: 888 }
                }
            }
        };
    }
}