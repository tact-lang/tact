struct DeepDef {
  a: Int = 1;
  b: Bool = false;
}

struct UpperDef {
  nested: DeepDef;
  val: Int = 2;
}

contract DefaultsInside {
    x: UpperDef;
    init() {
        self.x = UpperDef{ nested: DeepDef{} };
    }
    receive() {}
}