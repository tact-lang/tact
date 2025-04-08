// contract parameter syntax with nested optional struct
struct ParamStruct {
  foo: Int?;
  bar: Bool?;
  baz: String?;
}

contract ParamOptDemo(
  param: ParamStruct,
) {}