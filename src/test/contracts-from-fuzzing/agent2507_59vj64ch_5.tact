struct Level3 {
    val3: String?;
}

struct Level2 {
    val2: Int;
    l3: Level3;
}

struct Level1 {
    val1: Bool;
    l2: Level2;
}

contract NestedStructs {
    state: Level1;

    init() {
        self.state = Level1{
            val1: true,
            l2: Level2{
                val2: 42,
                l3: Level3{
                    val3: null,
                }
            }
        };
    }
}