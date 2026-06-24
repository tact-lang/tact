struct Level1 {
    l2: Level2?;
}

struct Level2 {
    l3: Level3?;
}

struct Level3 {
    l4: Level4?;
}

struct Level4 {
    val: Int;
}

contract DeepOptionals {
    nested: Level1;

    init() {
        self.nested = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{
                        val: 42
                    }
                }
            }
        };
    }
}