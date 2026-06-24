struct BoolDefaults {
  a: Bool; b: Bool; c: Bool;
}

contract BoolInit {
  st: BoolDefaults;
  init() {
    self.st = BoolDefaults{a:true, b:false, c:true};
  }
}