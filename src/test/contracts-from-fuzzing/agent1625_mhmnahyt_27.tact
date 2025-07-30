struct OnlyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
}

contract AllNullsInit {
  s: OnlyOptionals;

  init() {
    self.s = OnlyOptionals{
      a: null,
      b: null,
      c: null,
      d: null,
    };
  }
}
