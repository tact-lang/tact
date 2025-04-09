struct EmptyDefaultOpt {
  a: Int? = null;
}

contract OptNullDefault2 {
  val: EmptyDefaultOpt;

  init() {
    self.val = EmptyDefaultOpt{};
  }
}