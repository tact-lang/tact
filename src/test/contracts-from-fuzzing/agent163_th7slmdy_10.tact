struct Level3 { val: Int; }
struct Level2 { inner: Level3; }
struct Level1 { nested: Level2; }

contract DeepThreeLevels {
    s: Level1;
    init() {
        self.s = Level1{
            nested: Level2{
                inner: Level3{
                    val: 777
                }
            }
        };
    }
}