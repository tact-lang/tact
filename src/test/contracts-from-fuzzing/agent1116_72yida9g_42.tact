// optional struct param, inside optional struct param
contract DeepParams(
  x: Outer?,
) {}

struct Inner {
  val: Int?;
}

struct Outer {
  wrap: Inner?;
}
