// Contract params with optional nested struct param
struct S {
  x: Int?;
  y: Bool?;
}

contract ParamNestedOpt(
  pa: S?,
) {
  receive() {}
}