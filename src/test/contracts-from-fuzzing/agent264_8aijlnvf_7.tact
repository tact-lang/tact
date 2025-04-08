struct Level3 {
    val: Int;
}

struct Level2 {
    child: Level3;
}

struct Level1 {
    child: Level2;
}

contract DeepChain {
    root: Level1;

    init() {
        self.root = Level1{
            child: Level2{
                child: Level3{
                    val: 123,
                },
            },
        };
    }
}