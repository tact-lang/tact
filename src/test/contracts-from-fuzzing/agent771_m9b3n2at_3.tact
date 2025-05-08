struct Level3 {
    x: Int;
}

struct Level2 {
    a: Int;
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepEmbedding {
    data: Level1;
    init() {
        self.data = Level1{
            l2: Level2{
                a: 1,
                l3: Level3{x: 2}
            }
        };
    }
}