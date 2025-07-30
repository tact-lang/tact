struct Wrap {
  val: Int?;
}

contract UninitOptional {
  field: Wrap;

  init() {
    self.field = Wrap{ val:null };
  }
}