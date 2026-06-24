struct ManyOpt {
  v1: Int?;
  v2: Bool?;
  v3: Cell?;
  v4: Address?;
  v5: String?;
}

contract Opts {
  dat: ManyOpt;
  init() {
    self.dat = ManyOpt{
      v1: null,
      v2: true,
      v3: null,
      v4: null,
      v5: "hi",
    };
  }
}