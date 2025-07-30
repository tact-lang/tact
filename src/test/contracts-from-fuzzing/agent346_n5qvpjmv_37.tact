struct MultiLevel {
    inner: Level2;
}

struct Level2 {
    inner: Level3;
}

struct Level3 {
    val: Int?;
}

contract OptionalChain {
    nested: MultiLevel;

    init() {
        self.nested = MultiLevel{
            inner: Level2{
                inner: Level3{ val: null }
            }
        };
    }
}