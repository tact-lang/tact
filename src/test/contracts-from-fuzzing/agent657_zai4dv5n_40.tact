struct InnerMost {
    value: Int;
}

struct Level2 {
    deepest: InnerMost?;
}

struct Level1 {
    mid: Level2?;
}

contract DeepOptionChain {
    top: Level1?;

    init() {
        self.top = Level1{
            mid: Level2{
                deepest: InnerMost{value: 42}
            }
        };
    }
}