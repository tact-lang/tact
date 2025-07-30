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
      innerOpt: Inner{
        val: 777,
        msg: "hi",
      },
      count: 123
    };
  }
}
