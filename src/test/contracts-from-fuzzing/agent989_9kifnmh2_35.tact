struct RecA {
  next: RecB;
}

struct RecB {
  next: RecC;
}

struct RecC {
  value: Int;
}

contract Recursed {
  val: RecA;

  init() {
    self.val = RecA{
      next: RecB{
        next: RecC{ value:1 }
      }
    };
  }
}