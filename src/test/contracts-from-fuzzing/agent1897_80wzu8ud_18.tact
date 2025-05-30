struct Outer {
  x: Int;
  y: Inner; 
}

struct Inner {
  a: Int;
  b: Int;
  c: Innermost;
}

struct Innermost {
  s: String;
  q: Bool;
}

contract DeepEchelon {
  dat: Outer;

  init() {
    self.dat = Outer{
      x: 1,
      y: Inner{
        a: 2,
        b: 3,
        c: Innermost{
          s: "hello",
          q: false
        }
      }
    };
  }
}