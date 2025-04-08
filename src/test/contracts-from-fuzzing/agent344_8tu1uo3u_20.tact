struct BigOpt {
  a: Int?;
  b: String?;
  c: Bool?;
  d: Cell?;
  e: Slice?;
  f: Address?;
}

contract BigNullable {
  val: BigOpt = BigOpt{
    a: null,
    b: null,
    c: null,
    d: null,
    e: null,
    f: null,
  };
}