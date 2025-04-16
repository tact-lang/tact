struct MiddleS {
 a: Int;
 b: String;
}

struct OuterS {
  x: MiddleS;
  y: MiddleS;
}

contract NestedParamStruct(
    outer: OuterS
) {
}