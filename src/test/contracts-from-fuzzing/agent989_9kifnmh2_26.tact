struct Compose {
  i: Int;
  o: Other?;
}
struct Other {
  s: String;
}

contract ComplexOpt {
  val: Compose;

  init() {
    self.val = Compose{ i:7, o: Other{ s:"yo" } };
  }
}