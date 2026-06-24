struct Inner {
  x: Int = 1;
  y: Int?;
}

struct Outer {
  label: String = "Label";
  inner: Inner;
}

contract DoubleNestedStructField {
  data: Outer;
  init() {
    self.data = Outer{ inner: Inner{} };
  }
}