struct Combo {
  a: Int;
  b: Bool;
  c: String;
}

contract ComboFields {
  a: Int = 1;
  b: Bool = false;
  c: String = "hi";
  combo: Combo = Combo{ a: 42, b: true, c: "bye" };
}