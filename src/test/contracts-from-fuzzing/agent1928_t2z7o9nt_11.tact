struct Mid {
  val1: Int;
  val2: String?;
}

struct Top {
  m1: Mid;
  m2: Mid;
  m3: Mid;
}

contract MultiNestedTest {
  payload: Top;

  init() {
    self.payload = Top{
      m1: Mid{ val1:1, val2:null },
      m2: Mid{ val1:2, val2:"hi" },
      m3: Mid{ val1:3, val2:null }
    };
  }
}