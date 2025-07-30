struct SOpt {
  v: Int?;
}

contract OptionalInit {
  data: SOpt;

  init() {
    self.data = SOpt{ v: null };
  }
}
