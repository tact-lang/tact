struct DeepOpt {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
  e: Cell?;
  f: Slice?;
}

struct Nest {
  inner: DeepOpt;
}

contract VeryNestedOptionals {
  d: Nest;
  init() {
    self.d = Nest{
      inner: DeepOpt{
        a:null, b:null, c:null, d:null, e:null, f:null
      }
    };
  }
}