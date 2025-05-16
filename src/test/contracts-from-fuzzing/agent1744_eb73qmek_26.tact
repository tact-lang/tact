// test contract param with nested struct param,
// nested struct has an optional message field with explicit null default
message(99) InnerMsg { x: Int }

struct NestedParam {
  some: InnerMsg? = null;
  y: Int = 5;
}

contract ParamNested(
  nest: NestedParam
) {}
