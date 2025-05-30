// optional boolean fields only
struct OnlyOptionals {
  a: Bool?;
  b: Bool?;
  c: Bool?;
  d: Bool?;
}

contract OptBools {
  payload: OnlyOptionals;

  init() {
    self.payload = OnlyOptionals{
      a: true,
      b: null,
      c: false,
      d: null,
    };
  }
}
