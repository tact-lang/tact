struct InnerMost {
  val: Int;
}

struct Inner {
  im: InnerMost;
}

struct Outer {
  inr: Inner;
}

contract DeepNestedStruct {
    obj: Outer;

    init() {
        self.obj = Outer{ inr: Inner{ im: InnerMost{ val: 123 } } };
    }
}