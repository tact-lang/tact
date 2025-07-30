struct OptionalInner {
  optStr: String?;
  optBool: Bool?;
  optInt: Int?;
}

contract EmbeddedOptionalsTest(
  optInner: OptionalInner?
) {}
