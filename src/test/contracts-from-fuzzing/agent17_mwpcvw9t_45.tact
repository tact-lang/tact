struct LevelB {
  r: Int?;
}

struct LevelA {
  q: LevelB?;
}

contract OptionChain {
  p: LevelA = LevelA{q: null};
}