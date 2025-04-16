struct Mid2 {
  underr: Int;
}

struct Top2 {
  midfield: Mid2;
}

contract NestedStructTwo {
  container: Top2;

  init() {
    self.container = Top2{
      midfield: Mid2 { underr: 123 }
    };
  }
}
