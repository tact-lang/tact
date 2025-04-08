struct Inner {
  a: Int;
  b: Bool;
}

struct Container {
  item1: Inner;
  item2: Inner;
}

contract ManyNest {
  data: Container;

  init() {
    self.data = Container{
      item1: Inner{ a:1, b:true },
      item2: Inner{ a:2, b:false }
    };
  }
}
