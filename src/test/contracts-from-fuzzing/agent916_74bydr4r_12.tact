struct Level4 {
    val4: Int;
}

struct Level3 {
    nested4: Level4;
    val3: String;
}

struct Level2 {
    nested3: Level3;
    val2: Bool;
}

struct Level1 {
    nested2: Level2;
    val1: Int;
}

contract Test {
    saved: Level1;

    init() {
        self.saved = Level1{
            nested2: Level2{
                nested3: Level3{
                    nested4: Level4{
                        val4: 4444,
                    },
                    val3: "hello",
                },
                val2: true,
            },
            val1: 1111,
        };
    }
}