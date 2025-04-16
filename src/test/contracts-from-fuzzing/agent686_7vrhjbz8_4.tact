struct Inner {
  x: Int = 1;
}

struct Outer {
  y: Inner?; 
}

contract TestContract {
  s: Outer = Outer{};

  init() {}
}