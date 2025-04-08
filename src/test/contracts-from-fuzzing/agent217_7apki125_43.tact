struct L1 { a: Int; }
struct L2 { b: L1; }
struct L3 { c: L2; }

contract NestedParamStruct(
  foo: L3,
) {}