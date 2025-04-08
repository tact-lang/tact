// Parameter with nested optional struct param
struct ParamInner {
  foo: Int;
  bar: Bool;
}

struct ParamOuter {
  inner: ParamInner?;
}

contract ParamNestedOptional(
  info: ParamOuter
) {}
