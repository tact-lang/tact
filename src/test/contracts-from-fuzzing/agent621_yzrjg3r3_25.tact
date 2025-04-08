// Combine parameter style with nested structs
struct ParamStruct {
  foo: Int;
  bar: Bool?;
  baz: String;
}

contract CombParamNested(
  inner: ParamStruct,
  optionalInt: Int?,
  optionalStr: String?,
) {}
