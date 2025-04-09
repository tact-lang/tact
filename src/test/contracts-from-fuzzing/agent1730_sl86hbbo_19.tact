struct InnerStr {
  name: String;
  opt: String?;
}

struct MidStr {
  inner: InnerStr?;
}

struct OuterStr {
  mid: MidStr?;
}

contract ComplexStringNest {
  data: OuterStr;
  init() {
    self.data = OuterStr{
      mid: null
    };
  }
}