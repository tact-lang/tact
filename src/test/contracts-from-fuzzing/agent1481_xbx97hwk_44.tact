// Contract parameters with nested structs, optionals, mixed serialization
struct NestedSer {
  x: Int as uint8;
  y: Int?;
  z: Bool;
}

contract ParamComplex(
  simple: Int as uint256,
  nest: NestedSer,
  opt: NestedSer?,
) {
  receive() {}
}