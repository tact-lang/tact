struct RecA {
  next: RecB;
}

struct RecB {
  next: RecC;
}

struct RecC {
  value: Int;
}

contract RecContract {
  rec: RecA;

  init() {
    self.rec = RecA{
      next: RecB{
        next: RecC{
          value: 42
        }
      }
    };
  }
}
