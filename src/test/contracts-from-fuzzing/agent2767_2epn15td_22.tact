// Nested optionals combined with serialization annotations
struct InnerOpt {
  value: Int? as uint32;
}

struct OuterOpt {
  inner: InnerOpt?;
}

contract OptionalSerialize {
  data: OuterOpt;

  init() {
    self.data = OuterOpt{ inner: null };
  }
}