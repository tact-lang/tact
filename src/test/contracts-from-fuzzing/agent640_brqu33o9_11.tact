struct BigOptional {
  x1: Int?;
  x2: Int?;
  x3: Int?;
  x4: Int?;
  x5: Int?;
  x6: Int?;
  x7: Int?;
  x8: Int?;
  x9: Int?;
  x10: Int?;
}

contract BigOptTest {
  data: BigOptional;
  init() { self.data = BigOptional{}; }
}