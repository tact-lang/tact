struct InnerOpt { inner: String?; }
struct NestedInnerOpt { deeply: InnerOpt?; }

contract OptContract {
  nested: NestedInnerOpt;
  init() {
    self.nested = NestedInnerOpt{ deeply: null };
  }
}