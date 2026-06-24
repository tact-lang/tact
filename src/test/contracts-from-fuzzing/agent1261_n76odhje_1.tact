struct Nested {
  field1: Int;
  field2: Bool;
}

contract TestContract {
  nested1: Nested;
  nested2: Nested;
  nested3: Nested;
  nested4: Nested;
  nested5: Nested;
  nested6: Nested;
  nested7: Nested;
  nested8: Nested;
  nested9: Nested;
  nested10: Nested;

  init() {
    self.nested1 = Nested{field1: 1, field2: true};
    self.nested2 = Nested{field1: 2, field2: false};
    self.nested3 = Nested{field1: 3, field2: true};
    self.nested4 = Nested{field1: 4, field2: false};
    self.nested5 = Nested{field1: 5, field2: true};
    self.nested6 = Nested{field1: 6, field2: false};
    self.nested7 = Nested{field1: 7, field2: true};
    self.nested8 = Nested{field1: 8, field2: false};
    self.nested9 = Nested{field1: 9, field2: true};
    self.nested10 = Nested{field1: 10, field2: false};
  }
}