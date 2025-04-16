struct Variety {
  ai: Int;
  ab: Bool;
  aa: Address;
  ac: Cell;
  aslice: Slice;
  abldr: Builder;
  astr: String;
  ai_opt: Int?;
  ab_opt: Bool?;
  aa_opt: Address?;
  astr_opt: String?;
}

contract CrazyVariety {
  s: Variety;

  init() {
    self.s = Variety {
      ai:1, ab: true, aa: myAddress(), ac: emptyCell(), aslice: emptyCell().asSlice(),
      abldr: beginCell(), astr: "h", ai_opt:null, ab_opt:null, aa_opt:null, astr_opt:null
    };
  }
}
