// Contract parameter, struct with optional nested struct field
struct ChildOptional {
  foo: Int?;
}
struct Outer {
  bar: ChildOptional?;
}
contract ParamNestedOpt(
  data: Outer
) {
}