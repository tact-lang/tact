struct InnerMost {
    val: Int = 1;
}

struct Level2 {
    inner: InnerMost;
}

struct Level1 {
    level2: Level2;
}

contract DeepChain {
    data: Level1;
    init() {
        self.data = Level1{level2: Level2{inner: InnerMost{val: 5}}};
    }
}