// Nested struct with lots of optional fields deep inside contract param
struct InnerOpt {
  a: Int?;
  b: Bool?;
  c: Address?;
}

struct OuterOpt {
  inner: InnerOpt?;
  x: Int?;
}

contract OptNestParam(
  data: OuterOpt,
) {
  receive() {}
}