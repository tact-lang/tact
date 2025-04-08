struct DeepOptionals {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Int?;
  e: String?;
  f: Bool?;
}

contract TestContract {
  s: DeepOptionals = DeepOptionals{
    a: null, b: null, c: null,
    d: null, e: null, f: null
  };
}