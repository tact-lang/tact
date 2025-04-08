struct Nested {
  a: Int?;
  b: Bool;
  c: String;
}

contract ArrayLike {
  item1: Nested;
  item2: Nested;
  item3: Nested;

  init() {
    self.item1 = Nested{a:null, b:true, c:"x"};
    self.item2 = Nested{a:2, b:false, c:"y"};
    self.item3 = Nested{a:3, b:true, c:"z"};
  }
}