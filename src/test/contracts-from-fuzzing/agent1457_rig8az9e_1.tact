struct Nested {
  inner1: Int;
  inner2: Bool;
}

contract TestDeepOptional {
  data: Nested?; // Optional nested struct

  init() {
    self.data = null; // initialize to null explicitly
  }
}