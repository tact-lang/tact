struct Inner {
  msg: String;
}

struct Outer {
  flag: Bool;
  inner: Inner;
}

contract TestContract {
  out: Outer;

  init() {
    self.out = Outer{
      flag:true,
      inner:Inner{
        msg:"test"
      }
    };
  }
}