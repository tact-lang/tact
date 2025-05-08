struct L3 {
  a: Int = 4;
  b: Bool? = false;
  c: String = "x";
}

struct L2 {
  foo: L3 = L3{};
  bar: Int = 7;
}

struct L1 {
  mid: L2 = L2{};
  flag: Bool = true;
}

contract Test {
  data: L1;

  init() {
    self.data = L1{
      mid: L2{
        bar: 555,
        foo: L3{
          b: true
        }
      }
    };
  }
}