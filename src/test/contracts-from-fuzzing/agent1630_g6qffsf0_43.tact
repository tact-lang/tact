struct Deep1 { ii: Int; }
struct Deep2 { d: Deep1; }
struct Deep3 { d: Deep2; }
contract DeepOptionalChain {
  f: Deep3?;

  init() {
    self.f = null;
  }
}