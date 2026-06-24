struct Layer1 {
  a: Int;
  b: Int;
}

struct Layer2 {
  c: Layer1;
  d: Int;
}

struct Layer3 {
  e: Layer2;
  f: Int;
}

struct Layer4 {
  g: Layer3;
  h: Int;
}

contract DeepChain {
  content: Layer4;

  init() {
    self.content = Layer4{
      g: Layer3{
        e: Layer2{
          c: Layer1{
            a: 1,
            b: 2
          },
          d:3
        },
        f:4
      },
      h:5
    };
  }

  receive() {
    let _ = self.content.g.e.c.a;
  }
}
