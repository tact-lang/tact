struct DeeplyNestedOptional {
    innermost: Int?;
}
struct Level2 {
    inner: DeeplyNestedOptional?;
}
struct Level1 {
    inner: Level2?;
}

contract NullChain {
    l: Level1?;
    init() {
        self.l = null;
    }
}