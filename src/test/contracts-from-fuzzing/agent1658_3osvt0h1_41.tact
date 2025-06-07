struct EmptyOptS {
  x: Int?;
}

contract DefaultNullOpt {
  val: EmptyOptS;

  init() {
    self.val = EmptyOptS{ x: null };
  }
}