struct SkipDefault {
  a: Int = 1;
  b: Int;
}

contract Test {
  sd: SkipDefault = SkipDefault{ b: 123 };
}