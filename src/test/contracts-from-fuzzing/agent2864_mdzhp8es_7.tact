struct DeepOptionals {
  a: Int?;
  b: String?;
  c: Cell?;
  d: Slice?;
  e: Address?;
}

contract ComplexOptionals {
  data: DeepOptionals;

  init() {
    self.data = DeepOptionals{
      a:null,
      b:null,
      c:null,
      d:null,
      e:null
    };
  }
}