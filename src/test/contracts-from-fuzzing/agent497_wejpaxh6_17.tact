struct OptDeep {
  nest1: Inner1?;
}

struct Inner1 {
  nest2: Inner2?;
  val: Int;
}

struct Inner2 {
  val: Int;
}

contract TestContract {
  data: OptDeep;

  init() {
    self.data = OptDeep{
      nest1: Inner1{ nest2: null, val: 1 }
    };
  }
}