struct MixedOptional {
  x: Int;
  y: Int?;
  z: Bool;
}

contract TestContract {
  m: MixedOptional?;

  init() {
    self.m = MixedOptional{x:1,y:null,z:true};
  }
}