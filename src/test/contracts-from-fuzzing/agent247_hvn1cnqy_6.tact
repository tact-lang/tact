struct Level3 {
    leaf: Int;
}

struct Level2 {
    node: Level3;
    val2: Int;
}

struct Level1 {
    branch: Level2;
    val1: Int;
}

contract DeepThree {
    data: Level1;

    init() {
        self.data = Level1{
            branch: Level2{
                node: Level3{leaf: 42},
                val2: 2
            },
            val1: 1
        };
    }
}