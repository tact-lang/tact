struct Inner {
  x: Int;
  y: Int;
}

struct Outer {
  point: Inner;
  label: String;
}

contract TestContract {
  shape: Outer;

  init() {
    self.shape = Outer{
      point: Inner{x:7, y:11},
      label:"nested"
    };
  }
}