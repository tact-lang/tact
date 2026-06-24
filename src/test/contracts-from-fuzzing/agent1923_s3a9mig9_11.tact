struct StrOpt {
  s: String?;
}

contract ContractStrOpt {
  so: StrOpt;

  init() {
    self.so = StrOpt{ s: null };
  }
}