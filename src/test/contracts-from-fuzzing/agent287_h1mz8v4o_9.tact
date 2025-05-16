struct Mid {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Cell;
}

struct High {
  m: Mid;
  optionalMid: Mid?;
}

contract OptNested {
  content: High;

  init() {
    self.content = High{
      m: Mid{ a:null, b:true, c:null, d:emptyCell() },
      optionalMid: null
    };
  }
}