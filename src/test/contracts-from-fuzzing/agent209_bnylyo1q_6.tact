struct IntBool {
  a: Int;
  b: Bool;
}

contract TestContract {
  a: IntBool;
  b: IntBool;
  c: IntBool;

  init() {
    self.a = IntBool{a:1,b:true};
    self.b = IntBool{a:2,b:false};
    self.c = IntBool{a:3,b:true};
  }
}