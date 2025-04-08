struct Level2 {
  z: Int?;
}
struct Level1 {
  y: Bool;
  nested: Level2;
}
contract DeepNested {
  pers: Level1;
  init() {
    self.pers = Level1{
      y: true,
      nested: Level2{
        z: null,
      },
    };
  }
}