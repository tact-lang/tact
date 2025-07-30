struct MultiNestedOptionals {
    o1: Level1?;
}

struct Level1 {
    o2: Level2?;
}

struct Level2 {
    o3: Level3?;
}

struct Level3 {
    val: Int?;
}

contract TestMultiNestedOptionals {
    data: MultiNestedOptionals;

    init() {
        self.data = MultiNestedOptionals{
            o1: Level1{
                o2: Level2{
                    o3: Level3{
                        val: null
                    }
                }
            }
        };
    }
}
