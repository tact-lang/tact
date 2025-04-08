struct Wrapper {
  inner: Int? = null;
  flag: Bool = false;
  text: String = "";
}

contract OptionalDefault {
  state: Wrapper = Wrapper{};
  receive() {}
}