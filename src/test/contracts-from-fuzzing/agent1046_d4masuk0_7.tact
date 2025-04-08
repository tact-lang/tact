struct Combo {
  n: Int;
  flag: Bool? = null;
}

contract ComboNested {
  s: Combo = Combo{ n: 5 };
}
