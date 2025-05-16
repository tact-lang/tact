struct SOpt1 {
  o: Int?;
}

struct SOpt2 {
  o: SOpt1?;
}

struct SOpt3 {
  o: SOpt2?;
}

contract TripleNestedOption {
  s: SOpt3;

  init() {
    self.s = SOpt3 { o: null };
  }
}