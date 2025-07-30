struct Limits {
  minInt: Int = -1;
  zeroInt: Int = 0;
  maxInt: Int = 1;
}

contract StructWithDefaults {
  val: Limits = Limits{};
}
