struct S {
  a: Int = 1;
  b: Bool = false;
}

contract PartialPun {
  s: S = S{ a: 100 };
}