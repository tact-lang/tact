struct Level3 {
    deepVal: String = "deep";
}

struct Level2 {
    innerOpt: Level3? = null;
    num: Int = 42;
}

struct Level1 {
    optionalInner: Level2? = null;
    alwaysStr: String = "top";
}

contract DeepNested {
    field: Level1 = Level1{};
    init() {
        // no explicit assignment
    }
}