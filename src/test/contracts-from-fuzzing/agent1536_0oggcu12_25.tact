// Persistent state optional struct parameter, nested optional struct field
struct InnerParam {
  foo: Int;
  bar: Bool?;
}

contract ParamOptNested(
  nested: InnerParam?,
) {
}