struct NestedOptional {
  a: Int;
  b: Bool;
}

contract ParamWithOpt(
  nested: NestedOptional?,
) {}
