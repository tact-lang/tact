struct Partial {
  a: Int = 1;
  b: String = "hi";
  c: Bool = true;
}

contract PartialDefaults {
  x: Partial = Partial{ a: 42 };
  init() {}
}
