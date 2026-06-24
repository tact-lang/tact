struct Level3 {
    val3: Int;
    opt3: Bool?;
}

struct Level2 {
    val2: Int;
    nested3: Level3;
}

struct Level1 {
    val1: Int;
    nested2: Level2;
}

contract NestedDeep {
    data: Level1;

    init() {
        self.data = Level1{
            val1: 1,
            nested2: Level2{
                val2: 2,
                nested3: Level3{
                    val3: 3,
                    opt3: true,
                },
            },
        };
    }
}