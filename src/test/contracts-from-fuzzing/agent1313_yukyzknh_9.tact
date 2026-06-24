struct InnerMost {
  str: String;
}
struct InnerMid {
  inner: InnerMost;
}
struct InnerOuter {
  mid: InnerMid;
}
contract DeepFieldTree {
  root: InnerOuter;

  init() {
    self.root = InnerOuter{
      mid: InnerMid{
        inner: InnerMost{
          str: "deep"
        }
      }
    };
  }
}