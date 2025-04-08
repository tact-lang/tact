struct Nested {
  flag: Bool;
  count: Int;
}

contract Test {
  rec: Nested;
  
  init() {
    self.rec = Nested{
      flag: true,
      count: 42,
    };
  }
}
