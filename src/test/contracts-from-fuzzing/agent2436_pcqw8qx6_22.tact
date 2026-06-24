struct Booly {
  b1: Bool;
  b2: Bool;
  b3: Bool;
}

contract MultiBool {
  bs: Booly;

  init() {
    self.bs = Booly{b1:true, b2:false, b3:true};
  }
}