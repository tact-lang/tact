struct Level2 { val: Int; optional_val: Bool? }

struct Level1 {
  num: Int;
  nested: Level2;
}

contract DeepOptional {
  data: Level1?;
  
  init() {
    self.data = null;
  }
}