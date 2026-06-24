// multi-layer opt struct
struct Level3 {
  data: Int?;
}
struct Level2 {
  deep: Level3?;
}
struct Level1 {
  mid: Level2?;
}
contract DeepOpt {
  nested: Level1?;
  init() {
    self.nested = Level1{ mid: Level2{ deep: Level3{ data: null } } };
  }
}