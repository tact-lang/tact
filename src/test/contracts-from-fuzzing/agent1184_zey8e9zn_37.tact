struct Level0 { x: Int }
struct Level1 { a: Level0 }
struct Level2 { b: Level1 }
struct Level3 { c: Level2 }
struct Level4 { d: Level3 }
struct Level5 { e: Level4 }

contract NestedLvl5 {
    root: Level5;

    init() {
        self.root = Level5{
            e: Level4{
                d: Level3{
                    c: Level2{
                        b: Level1{
                            a: Level0{ x: 101 }
                        }
                    }
                }
            }
        };
    }
}