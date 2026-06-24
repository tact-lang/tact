struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
}

contract TestContract {
  data: ManyOptionals;

  init() {
    self.data = ManyOptionals{
      a: null,
      b: true,
      c: null,
      d: null
    };
  }
}