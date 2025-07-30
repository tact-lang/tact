struct LevelTwo {
    val: Int?;
}

struct LevelOne {
    nested: LevelTwo?;
}

contract NestedOptionChain {
    storage: LevelOne = LevelOne{ nested: null };
}