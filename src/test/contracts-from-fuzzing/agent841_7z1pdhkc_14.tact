struct Inner {
  val: Int?;
  msg: String?;
}

struct Outer {
  innerOpt: Inner?;
  count: Int = 0;
}

contract TestContract {
  data: Outer? = null;

  init() {
    self.data = Outer{
      innerOpt: null,
      count: 555
    };
  }
}
