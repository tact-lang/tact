struct BoolOnly {
  a: Bool;
  b: Bool;
  c: Bool;
}

contract TestContract {
  f: BoolOnly;

  init() {
    self.f = BoolOnly{a:true,b:false,c:true};
  }
}