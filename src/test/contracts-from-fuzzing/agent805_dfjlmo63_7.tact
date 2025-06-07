struct WithDefaultsPartial {
  a: Int = 11;
  b: Bool = true;
  c: String = "hi";
  d: Cell;
}

contract DefaultsPartial {
  data: WithDefaultsPartial;

  init() {
    self.data = WithDefaultsPartial{
      d: emptyCell()
    };
  }
}
