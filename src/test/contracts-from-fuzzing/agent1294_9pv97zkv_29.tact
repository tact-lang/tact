struct DeepInner {
  a: Int = 5;
  b: Bool? = null;
}

struct DeepOuter {
  nested: DeepInner = DeepInner{};
}

contract DefaultsNested {
  state: DeepOuter = DeepOuter{};
  receive() {}
}