struct Mix {
  x: Int; y: Bool?; z: String; w: String?; q: Cell;
}

struct Wrap {
  m: Mix?;
  s: String;
}

contract MixNestedOptional {
  opt: Wrap?;

  init() {
    self.opt = null;
  }
}