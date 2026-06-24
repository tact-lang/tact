// contract parameter syntax with multiple nested optional levels inside struct fields
struct Innermost { x: Int?; y: Bool? }

struct OuterParam {
  first: Innermost?;
  label: String?;
}

contract ComplexParams(
  data: OuterParam,
) {}