struct OneDeep {
  inner: InnerOne;
}

struct InnerOne {
  val: Int;
}

contract OneDeepContract {
  od: OneDeep;
  init() {
    self.od = OneDeep{
      inner: InnerOne{ val:5 }
    };
  }
}