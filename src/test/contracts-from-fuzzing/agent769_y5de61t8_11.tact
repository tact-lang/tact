struct Level4 { val4: Int; }
struct Level3 { val3: Level4; }
struct Level2 { val2: Level3; }
struct Level1 { val1: Level2; }

contract Deep4 {
    nested: Level1;
    init() {
        self.nested = Level1{
            val1: Level2{
                val2: Level3{
                    val3: Level4{
                        val4: 123
                    }
                }
            }
        };
    }
}