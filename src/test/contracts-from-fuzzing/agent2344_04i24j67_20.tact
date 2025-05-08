struct Inner {
  a: Int;
}
struct Middle {
  b: Inner;
}
struct Outer {
  c: Middle;
}

contract NestedStructs {
  s: Outer;

  init() {
    self.s = Outer{
      c: Middle{
        b: Inner{
          a: 777
        }
      }
    };
  }
}