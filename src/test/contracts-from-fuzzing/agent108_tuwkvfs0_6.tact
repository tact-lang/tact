struct Level3 {
    z: Int;
}

struct Level2 {
    innerL3: Level3;
    val2: String?;
}

struct Level1 {
    innerL2: Level2;
    val1: Bool;
}

contract Test5 {
    data: Level1;

    init() {
        self.data = Level1{
            innerL2: Level2{
                innerL3: Level3{
                    z: 123
                },
                val2: null
            },
            val1: true
        };
    }
}