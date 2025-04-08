struct MixedDepth {
    lev1: Level1;
}

struct Level1 {
    val: Int;
    lev2: Level2;
}

struct Level2 {
    opt: Int?;
    flag: Bool;
}

contract TestContract {
    md: MixedDepth = MixedDepth{
        lev1: Level1{
            val: 42,
            lev2: Level2{
                opt: null,
                flag: true
            }
        }
    };
}