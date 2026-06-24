// test only optional nested inside struct 
struct OptNest {
  field: Int?;
}

contract OptInStruct {
  s: OptNest;
  init() {
    self.s = OptNest{field: null};
  }
}