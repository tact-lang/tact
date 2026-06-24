// Deep optional fields present (not null)
struct Bottom {
  f: Int?;
}
struct Mid {
  bot: Bottom?;
}
struct Top {
  mid: Mid?;
}

contract MultiDeepPresent {
  t: Top;
  init() {
    self.t = Top{ mid:Mid{ bot:Bottom{f:null} } };
  }
}
