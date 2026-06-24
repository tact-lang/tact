struct AllOptional {
 x: Int?;
 y: String?;
 z: Bool?;
}

contract DefaultNulls {
  d: AllOptional;

  init() {
    self.d = AllOptional{
      x: null,
      y: null,
      z: null
    };
  }
}