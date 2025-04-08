struct Defaulted {
  x: Int = 7;
}

contract DefaultNested {
  f: Defaulted = Defaulted{};
}