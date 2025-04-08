// nested optional persist via params deep chain
struct Level3 { n: Int?; }
struct Level2 { l3: Level3?; }
struct Level1 { l2: Level2?; }

contract DeepParamOpt(
    root: Level1?
) {}