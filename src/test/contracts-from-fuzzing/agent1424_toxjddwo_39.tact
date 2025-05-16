struct SingleOptional {
  x: Int?;
}

contract SingleNestedOptionalTest {
  data: SingleOptional?;

  init() {
    self.data = null;
  }
}