struct InnerSeq {
  x: Int; y: Bool?; z: String;
}

struct OuterSeq {
  inner: InnerSeq?;
  val: Bool;
}

contract NestedOptionSeq {
    data: OuterSeq;

    init() {
        self.data = OuterSeq{ inner: null, val: false };
    }
}