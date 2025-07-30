struct OuterWrapper {
  container: InnerContainer;
}

struct InnerContainer {
  s1: String;
  s2: String?;
  b: Bool;
  inneropt: InnerMost?;
}

struct InnerMost {
  n: Int;
}

contract NestedOptionalInner {
  store: OuterWrapper;
  init() {
    self.store = OuterWrapper{
      container: InnerContainer{
        s1:"A", s2:null, b:true, inneropt:null
      }
    };
  }
}