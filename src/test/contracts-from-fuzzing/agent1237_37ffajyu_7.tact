struct Combination {
  x: Int;
  y: Bool;
  z: String;
  w: Address;
  t: Cell;
  u: Slice;
  opt1: Int?;
  opt2: Bool?;
  opt3: String?;
}

contract Test7 {
  comb: Combination;

  init() {
    self.comb = Combination{
      x:1, y:true, z:"hi", w:myAddress(), t:emptyCell(), u:emptyCell().asSlice(),
      opt1:null, opt2:null, opt3:null
    };
  }
}