struct PS {
  v: Int?;
  b: Bool?;
}

contract ParamOpt(
  d: PS,
) {
  receive() {
    self.d = self.d;
  }
}