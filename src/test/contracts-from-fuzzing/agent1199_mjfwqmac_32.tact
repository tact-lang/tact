struct Mixed {
  i: Int;
  s: String;
  b: Bool;
  optI: Int?;
  optS: String?;
  optB: Bool?;
  cell: Cell;
}

contract Test32 {
  m: Mixed;

  init() {
    self.m = Mixed{
      i:1, s:"u", b:true,
      optI:null, optS:null, optB:null,
      cell:emptyCell()
    };
  }
}