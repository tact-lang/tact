struct EmptyComposite {
  a: Int;
  b: String;
}

contract CompositeDefaults {
  data: EmptyComposite = EmptyComposite{ a: 1, b: "hi" };
  
  init() {
    self.data = EmptyComposite{ a: 2, b: "there" };
  }
}
