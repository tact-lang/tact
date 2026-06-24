struct Inner1 { val: Int }
struct Inner2 { foo: Bool }

struct Wrapper {
  a: Inner1;
  b: Inner2;
}

contract MultiNested {
  w: Wrapper;

  init() {
    self.w = Wrapper{ a: Inner1{val: 5}, b: Inner2{foo: false} };
  }
}