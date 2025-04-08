struct ManyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Address?;
}

contract VariedOptionals {
  data: ManyOptionals = ManyOptionals{
    a: null,
    b: null,
    c: null,
    d: null,
  };
}