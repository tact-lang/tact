struct Nested1 {
  val: Int;
}

struct Nested2 {
  nested: Nested1;
  flag: Bool;
}

contract DeepStructTest {
  data: Nested2;
  
  init() {
    self.data = Nested2 {
      nested: Nested1 { val: 123 },
      flag: true
    };
  }
}