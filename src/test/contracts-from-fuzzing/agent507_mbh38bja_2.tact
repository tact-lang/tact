struct Inner {
  a: Int;
  b: Bool;
  c: String;
}

struct Outer {
  one: Inner;
  two: Inner;
}

contract DoubleNest {
  data: Outer;

  init() {
    self.data = Outer{
      one: Inner{a:1,b:true,c:"x"},
      two: Inner{a:2,b:false,c:"y"},
    };
  }
}
