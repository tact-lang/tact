struct InnerS {
  y: Int?;
}

contract NestedParam(
  s: InnerS?  // optional struct with optional field inside
) {}