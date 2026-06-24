// deep nested optional default chain
struct LevelA {
  a: Int? = null;
}
struct LevelB {
  la: LevelA? = null;
}
contract DeepOptDefaults {
  lb: LevelB? = null;

  init() {
    self.lb = null;
  }
}