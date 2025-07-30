struct SDefaultOptional {
  s: String?;
}

contract DefaultNullOpt {
  val: SDefaultOptional;

  init() {
    self.val = SDefaultOptional{ s: null };
  }
}