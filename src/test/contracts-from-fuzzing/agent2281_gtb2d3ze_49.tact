contract NestedParamStyle(
  foo: Int,
  nested: StructParam
) {}

struct StructParam {
  x: Int;
  y: Bool;
  z: String;
}
