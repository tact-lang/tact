struct OuterFlat {
  a: Int;
  b: Bool;
  c: String;
}

struct NestedFlat {
  inner: OuterFlat;
}

contract ParamNested(
  val: NestedFlat,
) {}