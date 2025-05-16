struct OptionalInner {
  val: Int?;
}

contract NestedNullDefault {
  inner: OptionalInner? = null;

  init() {}
}