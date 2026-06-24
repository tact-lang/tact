struct InnerDeep {
  inna: InnerDeeper;
}

struct InnerDeeper {
  val: Int;
}

contract DeepCombo {
  a: Int;
  b: Bool;
  c: String;
  nest: InnerDeep;

  init() {
    self.a = 1;
    self.b = false;
    self.c = "ok";
    self.nest = InnerDeep{ inna: InnerDeeper{ val: 123 } };
  }
}