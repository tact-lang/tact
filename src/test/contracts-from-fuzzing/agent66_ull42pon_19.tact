// Struct with optional string defaulted to null inside persistent
struct Test {
  value: String?;
}

contract MyContract {
  thing: Test;

  init() {
    self.thing = Test{value: null};
  }
}