struct S {
  x: Int = 1;
  y: Bool = true;
}

contract DefaultsStruct {
  val: S;

  init() {
    self.val = S{};
  }
}