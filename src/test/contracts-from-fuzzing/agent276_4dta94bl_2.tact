struct Inner {
  val: Int;
}

struct Outer {
  optInner: Inner?;
}

contract OptStructHolder {
  data: Outer;

  init() {
    self.data = Outer{
      optInner: null,
    };
  }
}
