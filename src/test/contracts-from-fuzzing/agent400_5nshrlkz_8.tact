struct Inner {
  val: Int;
}

struct Outer {
  optInner: Inner?;
}

contract TestOptionalStruct {
  data: Outer;

  init() {
    self.data = Outer{
      optInner: null
    };
  }

  receive() {
    let opt = self.data.optInner;
    if (opt != null) {
      let v = opt!!.val;
    }
  }
}