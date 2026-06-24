struct DeepOptionalChain {
    nested: Level1?;
}
struct Level1 {
    nested: Level2?;
}
struct Level2 {
    nested: Level3?;
}
struct Level3 {
    num: Int?;
}

contract DeepOptionalChainContract {
    val: DeepOptionalChain;
    init() {
        self.val = DeepOptionalChain{nested: null};
    }
}