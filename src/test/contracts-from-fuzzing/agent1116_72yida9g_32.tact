// test contract parameters with deep nesting
contract ParamsTest(
  param: StructOuter,
) {
}

struct StructInner {
  val: Int;
}

struct StructOuter {
  inner: StructInner;
}
