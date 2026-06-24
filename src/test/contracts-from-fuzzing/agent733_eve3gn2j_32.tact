struct Inner {
  x: Int as int8 = 1;
  y: Bool = false;
}

struct Outer {
  sub: Inner? = null;
  flag: Bool = true;
  num: Int as uint32 = 300;
}

contract TestContract {
  val: Outer = Outer{};
  init() {}
}