struct SSubOpt {
  a: Int?;
}

contract NestedOptInner {
  s: SSubOpt;

  init() {
    self.s = SSubOpt{ a:null };
  }
}