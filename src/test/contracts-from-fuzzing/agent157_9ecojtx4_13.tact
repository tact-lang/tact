contract NestedStructsChain {
    a: Level1;

    init() {
        self.a = Level1{
            b: Level2{
                c: Level3{
                    d: Level4{
                        e: 42
                    }
                }
            }
        };
    }
}

struct Level1 { b: Level2 }
struct Level2 { c: Level3 }
struct Level3 { d: Level4 }
struct Level4 { e: Int }
