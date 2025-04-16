struct Nully {
  foo: Int?;
}

contract LazyOptional {
  val: Nully;

  init() {
    self.val = Nully{ foo: null };
  }
}