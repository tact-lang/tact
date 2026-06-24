struct PartialDef {
  a: Int = 5;
  b: Bool;
}

contract PartialDefStore {
  data: PartialDef;

  init() {
    self.data = PartialDef{
      b: true
    };
  }
}