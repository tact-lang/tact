struct Level4 { info: String?; }
struct Level3 { next: Level4?; }
struct Level2 { next: Level3?; }
struct Level1 { next: Level2?; }
struct Root    { next: Level1?; }

contract DeepNullableString {
  state: Root;

  init() {
    self.state = Root {
      next: null
    };
  }
}