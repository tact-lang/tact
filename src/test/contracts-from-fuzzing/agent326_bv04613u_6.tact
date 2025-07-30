struct Level3 { val3: Int }
struct Level2 { nested3: Level3 }
struct Level1 { nested2: Level2 }

contract TestNestedChain {
    root: Level1;

    init() {
        self.root = Level1{
            nested2: Level2{
                nested3: Level3{
                    val3: 1337
                }
            }
        };
    }
}
