// Contract param with optional nested struct containing optional primitives
struct Inner {
  a: Int?;
  b: Bool?;
}

contract DeepOptParam(
  dopt: Inner?,
) {
  receive() {}
}