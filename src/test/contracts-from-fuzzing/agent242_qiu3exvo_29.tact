struct Sub {
  y: Int;
}

struct Main {
  a: Int = 1;
  b: Bool = false;
  s: Sub;
}

contract ForcedInit {
  data: Main;
  init() {
    self.data = Main{
      a: 10, b: true,
      s: Sub{ y: 77 }
    };
  }
}