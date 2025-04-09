// Tuned serialization, nested structs, optionals
struct SerNest {
  a: Int as uint8;
  b: Int?;
}

struct TopSer {
  inner: SerNest?;
  c: Int as uint32;
}

contract ParamSerNest(
  p: TopSer,
) {
  receive() {}
}