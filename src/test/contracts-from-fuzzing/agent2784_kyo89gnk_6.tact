struct DeepOpt {
  a: Int?;
  b: Bool;
  c: Level2?;
}

struct Level2 {
  d: Bool;
  e: String?;
}

contract DeepOptional {
  st: DeepOpt;

  init() {
    self.st = DeepOpt{
      a: null,
      b: true,
      c: Level2{d: false, e: null}
    };
  }
}