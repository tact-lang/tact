struct Deep { val: Int; }
struct Middle { nested: Deep; }
struct Top { nested: Middle; }

contract Test {
  topOpt: Top?;

  init() {
    self.topOpt = null;
  }
}