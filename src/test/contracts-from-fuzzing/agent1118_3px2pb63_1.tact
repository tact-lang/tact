struct Nested1 {
  x: Int;
  y: Int?;
}

contract TestContract {
  data: Nested1;
  
  init() {
    self.data = Nested1{ x: 5, y: null };
  }
}