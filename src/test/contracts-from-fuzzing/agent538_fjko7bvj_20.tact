struct SOpt {
  x: Int?;
  b: Bool?;
  s: Sub?;
}

struct Sub {
  addr: Address?;
  cell: Cell;
}

contract OptionalDeep {
  data: SOpt;

  init() {
    self.data = SOpt{
      x: null,
      b: true,
      s: null
    };
  }
}
