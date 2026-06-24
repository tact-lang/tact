// contract with multiple nested optional fields, edge optional combinations
struct SubInner {
  a: Int?;
  b: String?;
}

struct MidInner {
  s: SubInner?;
}

struct OuterOptional {
  m: MidInner?;
}

contract NestedOptionals {
  data: OuterOptional;
  init() {
    self.data = OuterOptional{
      m: MidInner{
        s: null
      }
    };
  }
}