struct LevelX {
  id: Int;
  next: LevelY;
}
struct LevelY {
  code: String;
  next: LevelZ;
}
struct LevelZ {
  flag: Bool;
}

contract DeepNest2 {
  data: LevelX;
  init() {
    self.data = LevelX{
      id:1,
      next: LevelY{
        code:"Z",
        next: LevelZ{ flag:true }
      }
    };
  }
}