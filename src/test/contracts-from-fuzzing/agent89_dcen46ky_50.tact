struct DeepInner {
  foo: Int? = null;
  bar: String? = "abc";
}

struct MiddleContainer {
  nested: DeepInner?;
}

contract Fuzz50(
    top: MiddleContainer?,
) {}