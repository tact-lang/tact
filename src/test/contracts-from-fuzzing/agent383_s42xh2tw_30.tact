struct TwoLayers {
    sub: Inner;
}

struct Inner {
    val: Int;
}

contract Layered {
    data: TwoLayers;
    init() {
      self.data = TwoLayers{ sub: Inner{ val: 123 } };
    }
}
