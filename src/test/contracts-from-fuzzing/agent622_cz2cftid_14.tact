struct Deep {
  s: String = "deep";
}

struct Mid {
  d: Deep;
}

struct TopLevel {
  m: Mid;
}

contract DeepChain {
  val: TopLevel = TopLevel{ m: Mid{ d: Deep{} } };
  init() {}
}