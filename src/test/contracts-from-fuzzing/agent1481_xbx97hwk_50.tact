// Nested params with all primitive types + optionals
struct PrimGroup {
  a: Int;
  b: Bool;
  c: Address;
  d: Cell;
  e: Slice;
  f: String;
  g: Int?;
  h: Bool?;
  i: Address?;
  j: String?;
}

contract PrimParam(
  stuff: PrimGroup,
) {
  receive() {}
}