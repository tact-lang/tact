struct DeepNested {
  val1: Int;
  val2: Nested1;
}

struct Nested1 {
  a: Nested2;
}

struct Nested2 {
  b: Nested3;
}

struct Nested3 {
  c: Int?;
}

contract TestContract {
  storage: DeepNested;

  init() {
    self.storage = DeepNested{
      val1: 1,
      val2: Nested1{
        a: Nested2{
          b: Nested3{ c: null }
        }
      }
    };
  }
}