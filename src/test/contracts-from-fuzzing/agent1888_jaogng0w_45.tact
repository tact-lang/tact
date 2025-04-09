struct Inner { val: Int?; }
struct Mid { inner: Inner?; }
struct Deep { mid: Mid?; }

contract OptChain {
  state: Deep?;

  init() {
    self.state = null;
  }
}
