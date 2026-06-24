struct Inner1 {
 value: Int;
}

struct Inner2 {
 value: Inner1;
}

struct Inner3 {
 value: Inner2;
}

struct Inner4 {
 value: Inner3;
}

struct Inner5 {
 value: Inner4;
}

contract FiveDeepNestedStructContract {
  deep: Inner5;

  init() {
    self.deep = Inner5{ value: Inner4{ value: Inner3{ value: Inner2{ value: Inner1{ value: 77 } } } } };
  }
}