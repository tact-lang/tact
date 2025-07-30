struct C1 {
  field: Int;
}

struct C2 {
  field: C1;
}

struct C3 {
  field: C2;
}

contract Chain {
  ch: C3;

  init() {
    self.ch = C3{field: C2{field: C1{field: 123}}};
  }
}