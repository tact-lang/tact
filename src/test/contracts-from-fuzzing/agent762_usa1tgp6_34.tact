struct MultiOpt {
  i: Int?;
  s: String?;
  a: Address?;
}

contract StructWithOpts {
  inner: MultiOpt;

  init() {
    self.inner = MultiOpt { i:null, s:null, a:null };
  }
}