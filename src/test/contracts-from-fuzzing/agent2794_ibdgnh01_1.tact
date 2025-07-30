struct Inner {
  x: Int;
  y: Int?;
}

struct Outer {
  point: Inner?;
  name: String?;
  amount: Int?;
}

contract DeepOptionals {
  state: Outer; 

  init() {
    self.state = Outer{
      point: null,
      name: null,
      amount: null
    };
  }
}