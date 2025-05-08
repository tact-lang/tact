// deeply nested optional at top level
struct Inner1 {
  x: Int;
}

struct Inner2 {
  inner: Inner1?;
}

struct Inner3 {
  inner2: Inner2?;
}

contract TestContract {
  d: Inner3?;

  init() {
    self.d = Inner3{
      inner2: Inner2{
        inner: Inner1{ x: 5 }
      }
    };
  }
}