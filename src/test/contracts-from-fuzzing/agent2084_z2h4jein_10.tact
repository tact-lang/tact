struct Nested {
  i: Int;
  opt: String?;
}

contract Test {
  first: Nested;
  second: Nested;
  third: Nested;

  init() {
    self.first = Nested{i: 1, opt: "a"};
    self.second = Nested{i: 2, opt: null};
    self.third = Nested{i: 3, opt: "c"};
  }
}
