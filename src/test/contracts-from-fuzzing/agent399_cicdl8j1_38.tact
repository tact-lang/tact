struct OptMixing {
  a: Int?;
  b: Bool;
  c: String?;
  d: Address;
}

contract OptMixStorage {
  r: OptMixing;

  init() {
    self.r = OptMixing{ a:null, b:true, c:null, d:myAddress() };
  }
}