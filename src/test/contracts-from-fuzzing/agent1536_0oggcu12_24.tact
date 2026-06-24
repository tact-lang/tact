// Testing contract parameter style with optional and nested struct
struct ParamStr {
  x: Int;
  y: Bool?;
}

contract ParamStyle(
  a: Int,
  b: ParamStr?,
) {
}