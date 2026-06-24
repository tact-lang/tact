struct Mix {
  a: Int;
  b: Bool?;
  c: String;
  d: Slice?;
  e: Builder;
  f: Cell;
  g: Address?;
}

contract TestMix {
  val: Mix;

  init() {
    self.val = Mix{
      a: 7,
      b: null,
      c: "ok",
      d: null,
      e: beginCell(),
      f: emptyCell(),
      g: null
    };
  }
}