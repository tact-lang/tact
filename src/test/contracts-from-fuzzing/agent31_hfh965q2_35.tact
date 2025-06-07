struct NestedBool {
  flag: Bool;
  opt: Bool?;
}

contract Test {
  field: NestedBool;

  init() {
    self.field = NestedBool{flag:true,opt:null};
  }
}