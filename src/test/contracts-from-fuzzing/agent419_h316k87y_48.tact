// contract param with struct with optional fields
struct Inner {
  x: Int?;
  y: String?;
}
contract ParamWithOptStruct(
  f: Inner
) {}