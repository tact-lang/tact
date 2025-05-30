struct Chain1 { a: Int; }
struct Chain2 { b: Chain1; }
struct Chain3 { c: Chain2; }

contract OptChain {
  val: Chain3?;
  init() {
    self.val = null;
  }
}