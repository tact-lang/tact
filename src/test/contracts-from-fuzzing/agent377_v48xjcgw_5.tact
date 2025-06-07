struct Inner {
  value: Int;
}

struct Outer {
  val: Int;
  child: Inner?;
}

contract TestContract {
  data: Outer;

  init() {
    self.data = Outer{
      val: 123,
      child: null
    };
  }
}