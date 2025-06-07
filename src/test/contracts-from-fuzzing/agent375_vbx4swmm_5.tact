struct Level4 {
    val4: Int = 4;
    optional4: String?;
}

struct Level3 {
    val3: Int = 3;
    sub4: Level4;
}

struct Level2 {
    val2: Int = 2;
    sub3: Level3;
}

struct Level1 {
    val1: Int = 1;
    sub2: Level2;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{
            val1: 10,
            sub2: Level2{
                val2: 20,
                sub3: Level3{
                    val3: 30,
                    sub4: Level4{
                        val4: 40,
                        optional4: "deep",
                    },
                },
            },
        };
    }

    receive() {
        let _ = self.root;
    }
}