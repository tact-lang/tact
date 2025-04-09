struct Deep {
  a: Int;
  b: Bool;
}

struct Middle {
  d: Deep;
  e: Deep?;
}

struct Outer {
  m: Middle;
  n: Middle?;
  x: Int;
}

contract NestTest {
  o: Outer;
  num: Int;

  init() {
    self.num = 42;
    self.o = Outer{
      m: Middle{
          d: Deep{ a:1, b:true },
          e: null
      },
      n: null,
      x: 10
    };
  }
}