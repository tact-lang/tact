struct Deeply {
  a: Int;
  b: Layer2;
}

struct Layer2 {
  c: String;
  d: Layer3;
}

struct Layer3 {
  e: Bool;
  f: Layer4;
}

struct Layer4 {
  g: Int?;
}

contract DeepChain {
  data: Deeply;

  init() {
    self.data = Deeply{
      a: 1,
      b: Layer2{
        c: "two",
        d: Layer3{
          e: true,
          f: Layer4{
            g: null
          }
        }
      }
    };
  }
}