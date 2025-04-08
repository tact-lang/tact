// large nested struct chain with optional inside
struct Level3 {
    q: Int?;
}
struct Level2 {
    p: Level3;
}
struct Level1 {
    l: Level2;
}

contract DeepOptionChain {
    data: Level1;

    init() {
        self.data = Level1{
            l: Level2{
                p: Level3{
                    q: null,
                },
            },
        };
    }
}