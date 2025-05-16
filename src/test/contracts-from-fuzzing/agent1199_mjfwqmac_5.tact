struct OptionalNest {
  a: Int?;
  b: String?;
  c: Bool?;
}

struct Wrapper {
  nested: OptionalNest?;
}

contract Test5 {
  field: Wrapper;

  init() {
    self.field = Wrapper{ nested: OptionalNest{a:1,b:"x",c:true} };
  }
}