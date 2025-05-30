struct DeepDef {
  a: Int = 1;
  b: Bool = false;
}

struct UpperDefOpt {
  nested: DeepDef?;
  val: Int = 2;
}

contract DefOptMix {
    s: UpperDefOpt;
    init() {
        self.s = UpperDefOpt{ nested: null };
    }
    receive() {}
}