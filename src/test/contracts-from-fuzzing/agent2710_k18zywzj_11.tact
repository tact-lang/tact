struct InnerMost {
  val: Int;
}

struct Inner {
  im: InnerMost;
}

struct Middle {
  inner: Inner;
}

contract ManyLayers {
    data: Middle;

    init() {
        self.data = Middle{ inner: Inner{ im: InnerMost{ val: 5 } } };
    }
}