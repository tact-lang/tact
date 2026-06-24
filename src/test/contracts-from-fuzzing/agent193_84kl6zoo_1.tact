struct Nested1 { val1: Int; }

struct Nested2 {
  val2: Nested1;
}

contract DeepNestedContract {
  inner: Nested2;
  
  init() {
    self.inner = Nested2{ val2: Nested1{ val1: 123 } };
  }
}