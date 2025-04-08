// corner case: contract param with deeply nested optional of struct inside optional struct (allowed)
struct X {
  val: Int;
}
struct Y {
  inner: X?;
}
contract DeepOptParam(
  maybe: Y?,
  id: Int
) {}
