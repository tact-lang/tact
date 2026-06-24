struct ManyOpts {
  o0: Int?;
  o1: Int?;
  o2: Int?;
  o3: Int?;
  o4: Int?;
}

contract LotsOfOpts {
  x: ManyOpts;

  init() {
    self.x = ManyOpts{
      o0: null,
      o1: 1,
      o2: null,
      o3: 3,
      o4: null,
    };
  }
}