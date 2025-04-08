struct Leaf {
  a: Int;
  b: Bool;
}

struct Inner {
  x: Leaf;
  y: Leaf;
}

struct Container {
  in1: Inner;
  in2: Inner;
  opt: String?;
}

contract ManyNested {
  store: Container = Container{
    in1: Inner{ x: Leaf{a:1,b:true}, y: Leaf{a:2,b:false} },
    in2: Inner{ x: Leaf{a:3,b:true}, y: Leaf{a:4,b:false} },
    opt: null,
  };

  init() {
    self.store = self.store;
  }
  
  receive() {
    self.store = self.store;
  }
}