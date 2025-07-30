// Multi-level optional nested fields
struct Bottom {
  f: Int?;
}
struct Mid {
  bot: Bottom?;
}
struct Top {
  mid: Mid?;
}

contract MultilevelOpts {
  t: Top;
  init() {
    self.t = Top{ mid:null };
  }
}
