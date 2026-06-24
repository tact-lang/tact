struct OptionBool {
  f: Bool?;
}
struct OptionStr {
  f: String?;
}

contract MultiOpts {
  ob: OptionBool;
  os: OptionStr;
  init() {
    self.ob = OptionBool{ f: null };
    self.os = OptionStr{ f: null };
  }
}