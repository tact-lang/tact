struct BoolFields {
  a: Bool;
  b: Bool;
  c: Bool;
  d: Bool;
  e: Bool;
  f: Bool;
}

contract TestContract {
  data: BoolFields;
  init() {
    self.data = BoolFields{ a:true, b:false, c:true, d:false, e:true, f:false };
  }
}