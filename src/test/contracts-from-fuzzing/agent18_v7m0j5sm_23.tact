struct Inner1 {
  val: Int;
  next: Inner2?;
}

struct Inner2 {
  val: Int;
  next: Inner3?;
}

struct Inner3 {
  val: Int;
}

contract LinkedNestedOptionals {
  inner: Inner1;

  init() {
    self.inner = Inner1{ val:1, next: Inner2{ val:2, next: Inner3{val:3} } };
  }
}