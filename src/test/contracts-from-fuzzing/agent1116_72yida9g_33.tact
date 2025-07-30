// contract parameters with optionals nested
contract ParamsOpt(
  param: StructOuter?,
) {
}

struct StructInner {
  val: Int;
}

struct StructOuter {
  inner: StructInner?;
}
