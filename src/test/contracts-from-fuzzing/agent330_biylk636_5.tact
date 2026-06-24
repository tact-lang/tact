struct OptNest {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Cell?;
  e: Slice?;
}

contract StoreOptNest {
  data: OptNest;
  init() {
    self.data = OptNest {
      a:null, b:null, c:null, d:null, e:null
    };
  }
}
