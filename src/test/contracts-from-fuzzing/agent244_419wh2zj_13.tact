// optional String in nested struct
struct Inner {
  content: String?;
}

struct Outer {
  nested: Inner;
}

contract OptionalStringNested {
  data: Outer;

  init() {
    self.data = Outer{
      nested: Inner{
        content: null,
      }
    };
  }
}