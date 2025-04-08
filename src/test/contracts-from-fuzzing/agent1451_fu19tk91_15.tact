struct ParamStruct {
  v: Int;
  b: Bool;
}

contract ParamStyle(
  data: ParamStruct,
) {
  receive() {
    self.data = self.data;
  }
}