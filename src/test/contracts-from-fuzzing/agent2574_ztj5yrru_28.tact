struct AltOrder {
  a: Int;
  b: String;
  c: Bool;
  d: Int?;
  e: String?;
}

contract FieldOrdering {
  alt: AltOrder;

  init() {
    self.alt = AltOrder{
      a: 1, b: "z", c: true, d: null, e: "yo"
    };
  }
}