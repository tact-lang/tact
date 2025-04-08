struct SOpt {
  f: Int?;
  s: String?;
}

contract OptFieldsContract {
  o1: SOpt;
  o2: SOpt;

  init() {
    self.o1 = SOpt{f: null, s: null};
    self.o2 = SOpt{f: 1, s: "hi"};
  }
}