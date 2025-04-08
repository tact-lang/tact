struct ABool {
  a: Bool;
  b: Bool;
  c: Bool;
}

contract PackedBools {
  bs: ABool;
  init() {
    self.bs = ABool{ a:true, b:false, c:true };
  }
}