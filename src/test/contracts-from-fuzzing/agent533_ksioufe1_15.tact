struct NestedBool {
  a: Bool;
  b: Bool?;
  c: Bool;
  d: Bool?;
}

contract BoolVariants {
  val: NestedBool;

  init() {
    self.val = NestedBool{
      a:true,
      b:null,
      c:false,
      d:true
    };
  }
}