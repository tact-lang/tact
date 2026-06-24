struct MixDefaultOpt {
  a: Int?;
  b: Bool = false;
  c: String?;
}

contract MixTest {
  rec: MixDefaultOpt;

  init() {
    self.rec = MixDefaultOpt{ a:null, c:null };
  }
}
