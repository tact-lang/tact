// Contract using parameters with nested struct param
struct S {
  x: Int;
  y: Bool;
}

contract ParamNested(
  pa: S,
) {
  receive() {}
}