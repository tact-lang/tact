struct InnerStr {
  text: String;
}

struct WithString {
  num: Int;
  inner: InnerStr;
}

contract StringNestTest {
  val: WithString = WithString{
    num: 1,
    inner: InnerStr{ text: "hello" }
  };

  init() {}
}
