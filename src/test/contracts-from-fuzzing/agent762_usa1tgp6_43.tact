struct WithOptDefaults {
  i: Int?;
  s: String?;
  f: Bool?;
}

contract OptDefaults {
  v: WithOptDefaults;

  init() {
    self.v = WithOptDefaults { i:null, s:null, f:null };
  }
}