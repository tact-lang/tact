struct Inner1 { val1: Int }
struct Inner2 { val2: String }
struct Inner3 { val3: Bool }

struct Container {
  i1: Inner1;
  i2: Inner2;
  i3: Inner3;
}

contract ManyNestedStructs {
  c: Container;

  init() {
    self.c = Container{
      i1: Inner1{val1: 1},
      i2: Inner2{val2: "hi"},
      i3: Inner3{val3: false}
    };
  }
}