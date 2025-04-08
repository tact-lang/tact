struct LL2 {
  x: Int;
  y: String?;
}

struct LL1 {
  a: Int?;
  b: LL2;
}

contract Combo {
  data: LL1;

  init() {
    self.data = LL1{
      a: null,
      b: LL2{
        x: 1,
        y: null
      }
    };
  }
}