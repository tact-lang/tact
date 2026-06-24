struct NestedWithOptionals {
  i: Int?;
  b: Bool?;
  s: String?;
  inside: InnerOptional?;
}

struct InnerOptional {
  x: Int;
  y: Bool;
}

contract Test {
  storage: NestedWithOptionals;

  init() {
    self.storage = NestedWithOptionals{
      i: null,
      b: true,
      s: "hi",
      inside: InnerOptional{ x:42, y:false }
    };
  }
}