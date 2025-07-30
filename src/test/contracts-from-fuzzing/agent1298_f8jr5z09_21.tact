struct SA {
  x: Int;
}
struct SB {
  y: Int;
}
struct SC {
  a: SA;
  b: SB;
}

contract ManyNested {
  val: SC;
  init() {
    self.val = SC{
      a: SA{x: 1},
      b: SB{y: 2}
    };
  }
}