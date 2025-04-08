contract ManyPrimitives {
  i: Int = -42;
  b: Bool = true;
  s: String = "ok";
  // omit cell field as emptyCell() can't be used
  a: Address;

  init() {
    self.a = myAddress();
  }
}
