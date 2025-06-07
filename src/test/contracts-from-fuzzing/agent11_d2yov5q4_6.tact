struct Level3 {
    deepVal: Int;
}

struct Level2 {
    l3: Level3;
    val2: Int;
}

struct Level1 {
    l2: Level2;
    val1: Int;
}

contract DeepNestTest {
    store: Level1;

    init() {
        self.store = Level1{
            l2: Level2{
                l3: Level3{
                    deepVal: 999,
                },
                val2: 20,
            },
            val1: 10,
        };
    }
}