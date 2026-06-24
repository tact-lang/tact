// nested structs with defaults
struct Level2 { x: Int=5; y: Bool=false; }
struct Level1 { inner: Level2; z: String="hi"; }

contract NestedDefaults {
  data: Level1;
  init() {
    self.data = Level1 {
      inner: Level2{},
    };
  }
}