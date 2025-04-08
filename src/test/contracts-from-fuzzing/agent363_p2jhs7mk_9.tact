struct MixPrimitives {
  i: Int;
  b: Bool;
  a: Address;
  s: String;
  c: Cell;
}

contract TestContract {
  m: MixPrimitives;

  init() {
    self.m = MixPrimitives{
      i: 10,
      b: false,
      a: myAddress(),
      s: "hello",
      c: emptyCell()
    };
  }
}