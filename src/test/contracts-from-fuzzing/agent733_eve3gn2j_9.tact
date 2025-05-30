struct Inner {
  val: Int = 100;
}

struct Container {
  a: Inner? = null;
  b: Inner? = Inner{ val: 5 };
}

contract TestContract {
  c: Container = Container{};
  init() {}
}