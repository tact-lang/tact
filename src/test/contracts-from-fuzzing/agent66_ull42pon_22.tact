// Big mixed struct chain and optional + default nested
struct InnerMost {
  a: Int = 1;
  b: Bool? = null;
  c: String? = null;
}
struct Mid {
  x: Int;
  y: InnerMost;
}
struct Root {
  first: Mid;
  second: Mid;
}
contract TestContract {
  r: Root;
  init() {
    let im = InnerMost{a:1,b:null,c:null};
    let m = Mid{x:0,y:im};
    self.r = Root{first: m, second: m};
  }
}