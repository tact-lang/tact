struct DeepOptional {
  a: Int?;
  b: String?;
}

struct ContainsOpt {
  x: DeepOptional?;
  y: Int;
}

contract OptionalStructs {
  s: ContainsOpt = ContainsOpt{x: null, y: 5};
}