struct InnerOptional {
  label: String?;
}

contract StructOptionalInside {
  data: InnerOptional?;

  init() {
    self.data = null;
  }
}