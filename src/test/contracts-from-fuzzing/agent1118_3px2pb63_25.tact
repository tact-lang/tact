struct DuplicateNames {
  x: Int;
  y: Int;
}

contract DuplicateFieldsTest {
  x: Int;
  y: Int;
  data: DuplicateNames;

  init() {
    self.x = 1;
    self.y = 2;
    self.data = DuplicateNames{ x:3, y:4 };
  }
}