struct StrOpt {
  s: String? = "abc";
}

contract NullOverride {
  data: StrOpt;

  init() {
    self.data = StrOpt{ s: null };
  }

  receive() { dump(self.data.s); }
}