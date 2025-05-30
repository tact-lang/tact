struct ManyOpts {
  oi: Int?;
  ob: Bool?;
  os: String?;
  oa: Address?;
  occ: Cell?;
}

contract OptsContract {
  stuff: ManyOpts;

  init() {
    self.stuff = ManyOpts{ oi: 1, ob: false, os: null, oa: null, occ: null };
  }
}