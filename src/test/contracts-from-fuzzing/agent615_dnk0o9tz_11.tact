struct Inlined {
  a: Int;
  b: Inner;
}

struct Inner {
  x: Int;
  y: Bool?;
}

contract TestContract {
  s: Inlined;

  init() {
    self.s = Inlined{
      a:1,
      b:Inner{x:2,y:null}
    };
  }
}