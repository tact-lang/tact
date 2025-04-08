struct StrOpt {
  s: String?;
}

contract OptStringStructField {
  f: StrOpt;

  init() {
    self.f = StrOpt{s:null};
  }
}