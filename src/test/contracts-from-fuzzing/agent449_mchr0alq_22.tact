// Multiple nested optional structs in parameters
struct InnerOpt {
  b: Int?;
}

struct OuterOpt {
  inner: InnerOpt?;
}

contract DeepOptionalParams(
  val: OuterOpt?,
) {}
