struct InnerOpt {
 x: Int?;
 y: Bool?;
}

contract ParamNestedOpt(
  foo: InnerOpt?,
  bar: Int?,
) {}