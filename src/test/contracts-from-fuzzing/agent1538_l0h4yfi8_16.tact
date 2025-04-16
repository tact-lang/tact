struct Inner {
  a: Int;
  b: Bool?;
  c: String;
}

struct Outer {
  one: Inner;
  two: Inner;
}

contract Test {
  storage: Outer;

  init() {
    self.storage = Outer{
      one: Inner{a:1,b:null,c:"x"},
      two: Inner{a:2,b:true,c:"y"}
    };
  }
}