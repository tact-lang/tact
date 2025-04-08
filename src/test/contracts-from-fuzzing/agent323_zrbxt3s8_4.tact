struct LevelA { n: Int }
struct LevelB { lvl: LevelA }
struct LevelC { lvl: LevelB }
struct LevelD { lvl: LevelC }
struct LevelE { lvl: LevelD }

contract Nest5 {
  field: LevelE;

  init() {
    self.field = LevelE{ lvl: LevelD{ lvl: LevelC{ lvl: LevelB{ lvl: LevelA{ n: 7 } } } } };
  }
}
