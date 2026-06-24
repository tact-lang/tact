struct Nested {
  inner1: Int;
  inner2: Bool;
}

contract StorageTest {
  point: Nested;  
  value: Int;

  init() {
    self.point = Nested{ inner1:1, inner2:true };
    self.value = 2;
  }
}