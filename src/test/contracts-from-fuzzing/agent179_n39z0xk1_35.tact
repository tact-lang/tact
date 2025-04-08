struct NestedManyLevels {
  s1: Level1;
}
struct Level1 {
  s2: Level2;
}
struct Level2 {
  s3: Level3;
}
struct Level3 {
  s4: Level4;
}
struct Level4 {
  num: Int;
}
contract VeryDeep {
  val: NestedManyLevels;
  init() {
    self.val = NestedManyLevels{
      s1: Level1{
        s2: Level2{
          s3: Level3{
            s4: Level4{ num:123 }
          }
        }
      }
    };
  }
}