// test optional inside struct inside optional container
struct Foo {
  bar: Inner?;
}

struct Inner {
  v: Int;
}

contract OptInsideOptStruct {
  data: Foo?;

  init() {
    self.data = null;
  }
}
