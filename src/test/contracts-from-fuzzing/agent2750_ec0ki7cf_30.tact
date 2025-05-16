struct DefaultNested {
  a: Int = 1;
  b: Int?;
}

struct OuterDefaultNested {
  inner: DefaultNested;
  txt: String = "hi";
}

contract DefaultNestedEx {
  data: OuterDefaultNested;
  init() {
    self.data = OuterDefaultNested {
      inner: DefaultNested {
        b: null
      }
    };
  }
}
