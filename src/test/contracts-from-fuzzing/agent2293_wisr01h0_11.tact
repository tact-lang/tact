struct OptInner {
  a: Int?;
  b: Bool?;
  c: String?;
}

struct Bigger {
  d: OptInner?;
}

contract ManyOpts {
  s: Bigger = Bigger{ d: null };
}