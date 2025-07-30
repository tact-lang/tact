struct ComplexParam {
  foo: Int;
  bar: Bool;
}

contract OptStructParam(
    nested: ComplexParam?,
) {}
// contract param: optional struct type