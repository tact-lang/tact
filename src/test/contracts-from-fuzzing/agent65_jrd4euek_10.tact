struct DeepInside {
  val: Int;
}

struct MidStruct {
  nested: DeepInside;
}

contract OptStructDeep {
  rec: MidStruct?;
  init() {
    self.rec = null;
  }
}