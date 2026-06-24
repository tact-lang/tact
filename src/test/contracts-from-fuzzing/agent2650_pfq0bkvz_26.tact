struct HasBools {
  a: Bool;
  b: Bool;
  c: Bool;
}

contract Test {
  x: HasBools;
  init() {
    self.x = HasBools{ a:true, b:false, c:true };
  }
}