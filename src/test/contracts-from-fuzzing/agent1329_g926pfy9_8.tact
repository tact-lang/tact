struct Optionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Slice?;
  e: Cell?;
  f: Address?;
}

contract OptionalFields {
  os: Optionals = Optionals{
    a: null,
    b: true,
    c: null,
    d: null,
    e: null,
    f: null,
  };
  init() {}
}
